/******************************************************************************
 *
 * Project:  OpenGIS Simple Features Reference Implementation
 * Purpose:  Implements OGRVFKDatasource class.
 * Author:   Martin Landa, landa.martin gmail.com
 *
 ******************************************************************************
 * Copyright (c) 2009-2010, 2013-2018 Martin Landa <landa.martin gmail.com>
 *
 * SPDX-License-Identifier: MIT
 ****************************************************************************/

#include "ogr_vfk.h"
#include "cpl_conv.h"
#include "cpl_string.h"

/*!
  \brief OGRVFKDataSource constructor
*/
OGRVFKDataSource::OGRVFKDataSource()
    : papoLayers(nullptr), nLayers(0), poReader(nullptr)
{
}

/*!
  \brief OGRVFKDataSource destructor
*/
OGRVFKDataSource::~OGRVFKDataSource()
{
    if (poReader)
        delete poReader;

    for (int i = 0; i < nLayers; i++)
        delete papoLayers[i];

    CPLFree(papoLayers);
}

/*!
  \brief Open VFK datasource

  \param poOpenInfo open info

  \return TRUE on success or FALSE on failure
*/
int OGRVFKDataSource::Open(GDALOpenInfo *poOpenInfo)
{
    /* create VFK reader */
    poReader = CreateVFKReader(poOpenInfo);
    if (poReader == nullptr || !poReader->IsValid())
    {
        /*
        CPLError(CE_Failure, CPLE_AppDefined,
                 "File %s appears to be VFK but the VFK reader can't"
                 "be instantiated",
                     pszFileName);
        */
        return FALSE;
    }

    bool bSuppressGeometry =
        CPLFetchBool(poOpenInfo->papszOpenOptions, "SUPPRESS_GEOMETRY", false);
    /* read data blocks, i.e. &B */
    poReader->ReadDataBlocks(bSuppressGeometry);

    /* get list of layers */
    papoLayers = (OGRVFKLayer **)CPLCalloc(sizeof(OGRVFKLayer *),
                                           poReader->GetDataBlockCount());

    /* create layers from VFK blocks */
    for (int iLayer = 0; iLayer < poReader->GetDataBlockCount(); iLayer++)
    {
        papoLayers[iLayer] =
            CreateLayerFromBlock(poReader->GetDataBlock(iLayer));
        nLayers++;
    }

    if (CPLTestBool(CPLGetConfigOption("OGR_VFK_DB_READ_ALL_BLOCKS", "YES")))
    {
        /* read data records if requested */
        poReader->ReadDataRecords();

        if (!bSuppressGeometry)
        {
            for (int iLayer = 0; iLayer < poReader->GetDataBlockCount();
                 iLayer++)
            {
                /* load geometry */
                poReader->GetDataBlock(iLayer)->LoadGeometry();
            }
        }
    }

    return TRUE;
}

/*!
  \brief Get VFK layer

  \param iLayer layer number

  \return pointer to OGRLayer instance or NULL on error
*/
OGRLayer *OGRVFKDataSource::GetLayer(int iLayer)
{
    if (iLayer < 0 || iLayer >= nLayers)
        return nullptr;

    return papoLayers[iLayer];
}

/*!
  \brief Test datasource capabilities

  \param pszCap capability

  \return TRUE if supported or FALSE if not supported
*/
int OGRVFKDataSource::TestCapability(const char *pszCap)
{
    if (EQUAL(pszCap, "IsPreProcessed") && poReader)
    {
        if (poReader->IsPreProcessed())
            return TRUE;
    }

    return FALSE;
}

/*!
  \brief Create OGR layer from VFKDataBlock

  \param poDataBlock pointer to VFKDataBlock instance

  \return pointer to OGRVFKLayer instance or NULL on error
*/
OGRVFKLayer *
OGRVFKDataSource::CreateLayerFromBlock(const IVFKDataBlock *poDataBlock)
{
    /* create an empty layer */
    OGRVFKLayer *poLayer = new OGRVFKLayer(
        poDataBlock->GetName(), nullptr, poDataBlock->GetGeometryType(), this);

    /* define attributes (properties) */
    for (int iField = 0; iField < poDataBlock->GetPropertyCount(); iField++)
    {
        VFKPropertyDefn *poProperty = poDataBlock->GetProperty(iField);
        OGRFieldDefn oField(poProperty->GetName(), poProperty->GetType());

        if (poProperty->GetWidth() > 0)
            oField.SetWidth(poProperty->GetWidth());
        if (poProperty->GetPrecision() > 0)
            oField.SetPrecision(poProperty->GetPrecision());

        poLayer->GetLayerDefn()->AddFieldDefn(&oField);
    }

    if (poDataBlock->GetReader()->HasFileField())
    {
        /* open option FILE_FIELD=YES specified, append extra
         * attribute */
        OGRFieldDefn oField(FILE_COLUMN, OFTString);
        oField.SetWidth(255);
        poLayer->GetLayerDefn()->AddFieldDefn(&oField);
    }

    return poLayer;
}
