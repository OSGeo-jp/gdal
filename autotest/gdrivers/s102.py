#!/usr/bin/env pytest
# -*- coding: utf-8 -*-
###############################################################################
# $Id$
#
# Project:  GDAL/OGR Test Suite
# Purpose:  Test read functionality for S102 driver.
# Author:   Even Rouault <even dot rouault at spatialys.com>
#
###############################################################################
# Copyright (c) 2023, Even Rouault <even dot rouault at spatialys.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
###############################################################################

import os
import shutil
import struct

import gdaltest
import pytest

from osgeo import gdal

pytestmark = pytest.mark.require_driver("S102")


###############################################################################


@pytest.mark.parametrize(
    "filename", ["data/s102/test_s102_v2.1.h5", "data/s102/test_s102_v2.2.h5"]
)
def test_s102_basic(filename):
    ds = gdal.Open(filename)
    assert ds.RasterCount == 2
    assert ds.RasterXSize == 3
    assert ds.RasterYSize == 2
    assert ds.GetSpatialRef().GetAuthorityCode(None) == "4326"
    assert ds.GetGeoTransform() == pytest.approx((1.8, 0.4, 0.0, 48.75, 0.0, -0.5))
    assert ds.GetMetadata_Dict() == {
        "AREA_OR_POINT": "Point",
        "VERTICAL_DATUM_ABBREV": "MLLW",
        "VERTICAL_DATUM_MEANING": "meanLowerLowWater",
        "geographicIdentifier": "Somewhere",
        "issueDate": "2023-12-31",
        "producer": "Generated by autotest/gdrivers/data/s102/generate_test.py (not strictly fully S102 compliant)",
    }

    depth = ds.GetRasterBand(1)
    assert depth.GetDescription() == "depth"
    assert depth.GetNoDataValue() == 1e6
    assert depth.GetMinimum() == 0
    assert depth.GetMaximum() == 5
    assert depth.GetUnitType() == "metre"
    assert struct.unpack("f" * 6, depth.ReadRaster()) == (1e6, 4, 5, 0, 1, 2)

    uncertainty = ds.GetRasterBand(2)
    assert uncertainty.GetDescription() == "uncertainty"
    assert uncertainty.GetNoDataValue() == 1e6
    assert uncertainty.GetMinimum() == 100
    assert uncertainty.GetMaximum() == 105
    assert uncertainty.GetUnitType() == "metre"
    assert struct.unpack("f" * 6, uncertainty.ReadRaster()) == (
        103,
        1e6,
        105,
        100,
        101,
        102,
    )

    assert "MD_" in ds.GetFileList()[1]

    del ds
    assert not os.path.exists(f"{filename}.aux.xml")

    with pytest.raises(Exception, match="Cannot find group /QualityOfSurvey"):
        gdal.Open(f'S102:"{filename}":QualityOfSurvey')


###############################################################################


def test_s102_elevation():
    ds = gdal.OpenEx(
        "data/s102/test_s102_v2.1.h5", open_options=["DEPTH_OR_ELEVATION=ELEVATION"]
    )
    assert ds.RasterCount == 2
    assert ds.RasterXSize == 3
    assert ds.RasterYSize == 2
    assert ds.GetSpatialRef().GetAuthorityCode(None) == "4326"
    assert ds.GetGeoTransform() == pytest.approx((1.8, 0.4, 0.0, 48.75, 0.0, -0.5))

    elevation = ds.GetRasterBand(1)
    assert elevation.GetDescription() == "elevation"
    assert elevation.GetNoDataValue() == 1e6
    assert elevation.GetMinimum() == -5
    assert elevation.GetMaximum() == 0
    assert struct.unpack("f" * 6, elevation.ReadRaster()) == (1e6, -4, -5, 0, -1, -2)

    uncertainty = ds.GetRasterBand(2)
    assert uncertainty.GetDescription() == "uncertainty"
    assert uncertainty.GetNoDataValue() == 1e6
    assert uncertainty.GetMinimum() == 100
    assert uncertainty.GetMaximum() == 105
    assert struct.unpack("f" * 6, uncertainty.ReadRaster()) == (
        103,
        1e6,
        105,
        100,
        101,
        102,
    )
    del ds
    assert not os.path.exists("data/s102/test_s102_v2.1.h5.aux.xml")


###############################################################################


def test_s102_north_up_no():
    ds = gdal.OpenEx("data/s102/test_s102_v2.1.h5", open_options=["NORTH_UP=NO"])
    assert ds.RasterCount == 2
    assert ds.RasterXSize == 3
    assert ds.RasterYSize == 2
    assert ds.GetSpatialRef().GetAuthorityCode(None) == "4326"
    assert ds.GetGeoTransform() == pytest.approx((1.8, 0.4, 0.0, 47.75, 0.0, 0.5))

    depth = ds.GetRasterBand(1)
    assert depth.GetDescription() == "depth"
    assert depth.GetNoDataValue() == 1e6
    assert depth.GetMinimum() == 0
    assert depth.GetMaximum() == 5
    assert struct.unpack("f" * 6, depth.ReadRaster()) == (0, 1, 2, 1e6, 4, 5)

    uncertainty = ds.GetRasterBand(2)
    assert uncertainty.GetDescription() == "uncertainty"
    assert uncertainty.GetNoDataValue() == 1e6
    assert uncertainty.GetMinimum() == 100
    assert uncertainty.GetMaximum() == 105
    assert struct.unpack("f" * 6, uncertainty.ReadRaster()) == (
        100,
        101,
        102,
        103,
        1e6,
        105,
    )
    del ds
    assert not os.path.exists("data/s102/test_s102_v2.1.h5.aux.xml")


###############################################################################


@pytest.mark.require_driver("HDF5")
def test_s102_identify_fallback_through_HDF5_driver():

    with gdaltest.config_option("GDAL_S102_IDENTIFY", "NO"):
        ds = gdal.Open("data/s102/test_s102_v2.1.h5")
    assert ds
    assert ds.GetDriver().GetDescription() == "S102"
    del ds
    assert not os.path.exists("data/s102/test_s102_v2.1.h5.aux.xml")


###############################################################################


def test_s102_multidim():
    ds = gdal.OpenEx("data/s102/test_s102_v2.1.h5", gdal.OF_MULTIDIM_RASTER)
    rg = ds.GetRootGroup()
    ar = rg.OpenMDArrayFromFullname(
        "/BathymetryCoverage/BathymetryCoverage.01/Group_001/values"
    )
    assert ar.GetSpatialRef().GetAuthorityCode(None) == "4326"

    assert ar.GetDimensions()[0].GetName() == "Y"
    y = ar.GetDimensions()[0].GetIndexingVariable()
    y_data = struct.unpack("d" * y.GetDimensions()[0].GetSize(), y.Read())
    assert y_data[0] == 48.0
    assert y_data[-1] == 48.5

    assert ar.GetDimensions()[1].GetName() == "X"
    x = ar.GetDimensions()[1].GetIndexingVariable()
    x_data = struct.unpack("d" * x.GetDimensions()[0].GetSize(), x.Read())
    assert x_data[0] == 2.0
    assert x_data[-1] == 2.8

    # Check that it doesn't go into infinite recursion
    gdal.MultiDimInfo(ds)


###############################################################################


def test_s102_QualityOfSurvey():

    ds = gdal.Open("data/s102/test_s102_v2.2_with_QualityOfSurvey.h5")
    assert ds.GetSubDatasets() == [
        (
            'S102:"data/s102/test_s102_v2.2_with_QualityOfSurvey.h5":BathymetryCoverage',
            "Bathymetric gridded data",
        ),
        (
            'S102:"data/s102/test_s102_v2.2_with_QualityOfSurvey.h5":QualityOfSurvey',
            "Georeferenced metadata QualityOfSurvey",
        ),
    ]

    with pytest.raises(Exception, match="Unsupported subdataset component"):
        gdal.Open('S102:"data/s102/test_s102_v2.2_with_QualityOfSurvey.h5":invalid')

    ds = gdal.Open(
        'S102:"data/s102/test_s102_v2.2_with_QualityOfSurvey.h5":BathymetryCoverage'
    )
    assert len(ds.GetSubDatasets()) == 0
    assert ds.RasterCount == 2
    assert ds.RasterXSize == 3
    assert ds.RasterYSize == 2

    ds = gdal.Open(
        'S102:"data/s102/test_s102_v2.2_with_QualityOfSurvey.h5":QualityOfSurvey'
    )
    assert len(ds.GetSubDatasets()) == 0
    assert ds.RasterCount == 1
    assert ds.RasterXSize == 3
    assert ds.RasterYSize == 2
    assert ds.GetSpatialRef().GetAuthorityCode(None) == "4326"
    assert ds.GetGeoTransform() == pytest.approx((1.8, 0.4, 0.0, 48.75, 0.0, -0.5))
    band = ds.GetRasterBand(1)
    assert band.DataType == gdal.GDT_UInt32
    assert band.GetNoDataValue() == 0
    assert struct.unpack("I" * 6, band.ReadRaster()) == (1000000, 3, 2, 0, 1, 2)

    rat = band.GetDefaultRAT()
    assert rat is not None
    assert rat.GetRowCount() == 5
    assert rat.GetColumnCount() == 3

    assert rat.GetNameOfCol(0) == "id"
    assert rat.GetTypeOfCol(0) == gdal.GFT_Integer
    assert rat.GetUsageOfCol(0) == gdal.GFU_MinMax

    assert rat.GetNameOfCol(1) == "floatval"
    assert rat.GetTypeOfCol(1) == gdal.GFT_Real

    assert rat.GetNameOfCol(2) == "strval"
    assert rat.GetTypeOfCol(2) == gdal.GFT_String

    assert rat.GetValueAsInt(0, 0) == 0
    assert rat.GetValueAsDouble(0, 1) == 1.5
    assert rat.GetValueAsString(0, 2) == "a"

    assert rat.GetValueAsInt(1, 0) == 1
    assert rat.GetValueAsDouble(1, 1) == 2.5
    assert rat.GetValueAsString(1, 2) == "b"

    assert rat.GetValueAsInt(4, 0) == 1000000
    assert rat.GetValueAsDouble(4, 1) == 5.5
    assert rat.GetValueAsString(4, 2) == "e"

    ds = gdal.OpenEx(
        'S102:"data/s102/test_s102_v2.2_with_QualityOfSurvey.h5":QualityOfSurvey',
        open_options=["NORTH_UP=NO"],
    )
    assert ds.GetGeoTransform() == pytest.approx((1.8, 0.4, 0.0, 47.75, 0.0, 0.5))
    band = ds.GetRasterBand(1)
    assert struct.unpack("I" * 6, band.ReadRaster()) == (0, 1, 2, 1000000, 3, 2)


###############################################################################


def test_s102_QualityOfSurvey_multidim():

    ds = gdal.OpenEx(
        "data/s102/test_s102_v2.2_with_QualityOfSurvey.h5", gdal.OF_MULTIDIM_RASTER
    )
    rg = ds.GetRootGroup()
    ar = rg.OpenMDArrayFromFullname(
        "/QualityOfSurvey/QualityOfSurvey.01/Group_001/values"
    )
    assert ar.GetSpatialRef().GetAuthorityCode(None) == "4326"

    assert ar.GetDimensions()[0].GetName() == "Y"
    y = ar.GetDimensions()[0].GetIndexingVariable()
    y_data = struct.unpack("d" * y.GetDimensions()[0].GetSize(), y.Read())
    assert y_data[0] == 48.0
    assert y_data[-1] == 48.5

    assert ar.GetDimensions()[1].GetName() == "X"
    x = ar.GetDimensions()[1].GetIndexingVariable()
    x_data = struct.unpack("d" * x.GetDimensions()[0].GetSize(), x.Read())
    assert x_data[0] == 2.0
    assert x_data[-1] == 2.8


###############################################################################
# Test force opening


def test_s102_force_opening():

    drv = gdal.IdentifyDriverEx("data/hdf5/groups.h5", allowed_drivers=["S102"])
    assert drv.GetDescription() == "S102"


###############################################################################
# Test force opening, but provided file is still not recognized (for good reasons)


def test_s102_force_opening_no_match():

    drv = gdal.IdentifyDriverEx("data/byte.tif", allowed_drivers=["S102"])
    assert drv is None


###############################################################################


def test_s102_metadata_compute_stats_first(tmp_path):

    out_filename = str(tmp_path / "out.h5")
    shutil.copy("data/s102/test_s102_v2.1.h5", out_filename)
    with gdal.Open(out_filename) as ds:
        ds.GetRasterBand(1).ComputeStatistics(False)
    with gdal.Open(out_filename) as ds:
        assert ds.GetRasterBand(1).GetMetadataItem("STATISTICS_MINIMUM") is not None
        ds.SetMetadataItem("foo", "bar")
    with gdal.Open(out_filename) as ds:
        assert ds.GetRasterBand(1).GetMetadataItem("STATISTICS_MINIMUM") is not None
        assert ds.GetMetadataItem("foo") == "bar"


###############################################################################


def test_s102_metadata_compute_stats_after(tmp_path):

    out_filename = str(tmp_path / "out.h5")
    shutil.copy("data/s102/test_s102_v2.1.h5", out_filename)
    with gdal.Open(out_filename) as ds:
        ds.SetMetadataItem("foo", "bar")
    with gdal.Open(out_filename) as ds:
        assert ds.GetMetadataItem("foo") == "bar"
        ds.GetRasterBand(1).ComputeStatistics(False)
    with gdal.Open(out_filename) as ds:
        assert ds.GetRasterBand(1).GetMetadataItem("STATISTICS_MINIMUM") is not None
        assert ds.GetMetadataItem("foo") == "bar"
