Þ                          b     ó   p  m   d  ü   Ò  V   Ï  Ç  &     î             ÷   À  K   ¸    	  ú  !
  6     P   S    ¤  E  ¼  (        +  $   Å  $   ê       ¯   $  d   Ô    9  X   M  ô   ¦  p     î     ^   û    Z     Ú  ,  ^         +  Z   A  =    ²   Ú  !     *   ¯    Ú  b   ø    [  ]  ô   P   R#  t   £#  >  $    W%  (   å&  Â   '     Ñ'  9   ð'  '   *(  Ã   R(     )  *  )  h   Æ*  )  /+     Y,    ç,  |   .   :program:`gdal_edit.py` has a ``-a_coord_epoch`` option to define the epoch of a dataset in place. :program:`gdal_translate` and :program:`ogr2ogr` have a ``-a_coord_epoch`` option to be used together with ``-a_srs``, and otherwise preserve the coordinate epoch in the output SRS from the source SRS when no SRS related options are specified. :program:`gdalinfo` and :program:`ogrinfo` report the coordinate epoch, when attached to a dataset/layer SRS. :program:`gdalwarp` and :program:`ogr2ogr` have a ``-s_coord_epoch`` option to be used together with ``-s_srs`` (resp. ``-t_coord_epoch`` option to be used together with ``-t_srs``) to override/set the coordinate epoch of the source (resp. target) CRS. :program:`gdalwarp` preserves the coordinate epoch in the output SRS when appropriate. At time of writing, no formats handled by GDAL/OGR have a standardized way of encoding a coordinate epoch. We consequently have made choices how to encode it, with the aim of being as much as possible backward compatible with existing readers. Those encodings might change if corresponding official specifications evolve to take this concept into account. The coordinate epoch is only written when attached to the SRS of the layer/dataset that is created. Before PROJ 9.4, ``-s_coord_epoch`` and ``-t_coord_epoch`` were mutually exclusive, due to lack of support for transformations between two dynamic CRS. Coordinate epoch support Dynamic CRS and coordinate epoch Each vector/raster table which has an associated coordinate epoch encodes it in the ``epoch`` column of the ``gpkg_spatial_ref_sys`` table, using an extended version of the CRS WKT extension (https://github.com/opengeospatial/geopackage/pull/600). Examples of dynamic CRS are ``WGS 84 (G1762)``, ``ITRF2014``, ``ATRF2014``. For vector formats, per-geometry coordinate epoch could also make sense, but as most formats only support a per-layer CRS, we also for now limit support of coordinate epoch at the layer level. The underlying coordinate transformation mechanics can support per-vertex coordinate epoch. Formally, the coordinate epoch of an observation belongs to the observation. However, almost all formats do not allow for storing per-observation epoch, and typical usage is a set of observations with the same epoch. Therefore we store the epoch as property of the CRS, and assume that it is valid for every observation. This choice eases processing, storage and format complexity for most usage. For now, this means that a dataset containing observations or points with different epochs cannot be handled. GeoJP2 boxes use the above mentioned GeoTIFF encoding. If a per-vertex time is specified, it overrides the one associated with the CRS. In a dynamic CRS, coordinates of a point on the surface of the Earth may change with time. To be unambiguous the coordinates must always be qualified with the epoch at which they are valid. The coordinate epoch is not necessarily the epoch at which the observation was collected. It can also take into account the coordinate epoch associated with a dynamic CRS, when doing time-dependent transformations between a static and dynamic CRS. The :config:`OGR_CT_USE_SRS_COORDINATE_EPOCH` configuration option can be set to ``NO`` to disable using the coordinate epoch associated with the source or target CRS. Persistent Auxiliary Metadata (.aux.xml) Such construct will not be understood by GDAL < 3.4, but if the CRS has an associated EPSG code, this will not cause issues in those older GDAL versions. Support in coordinate transformation Support in raster and vector formats Support in utilities The :cpp:class:`OGRCoordinateTransformation` class can perform time-dependent transformations between a static and dynamic CRS based on the coordinate epoch passed per vertex. The :cpp:func:`OGRSpatialReference::IsDynamic` method can be used to test if a CRS is a dynamic one. The :cpp:func:`OGRSpatialReference::SetCoordinateEpoch` and :cpp:func:`OGRSpatialReference::GetCoordinateEpoch` methods can be used to set/retrieve a coordinate epoch associated with a CRS. The coordinate epoch is expressed as a decimal year (e.g. 2021.3 for April 21, 2021). The coordinate epoch is encoded as ``coordinateEpoch`` attribute of the ``SRS`` element. The coordinate epoch is encoded as a WKT:2019 string using the ``EPOCH`` subnode of the `COORDINATEMETADATA <http://docs.opengeospatial.org/is/18-010r7/18-010r7.html#130>`__ construct, set in the ``Crs.wkt`` header field of the FlatGeoBuf file. The coordinate epoch is encoded as a new GeoTIFF GeoKey, ``CoordinateEpochGeoKey`` of code 5120 and type DOUBLE. The generic EPSG:4326 WGS 84 CRS is also considered dynamic, although it is not recommended to use it due to being based on a datum ensemble whose positional accuracy is 2 meters, but prefer one of its realizations, such as WGS 84 (G1762) This document is intended to document the support for coordinate epoch, linked to dynamic CRS. Project-Id-Version: GDAL 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2024-07-01 04:49+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Yoichi Kayama <yoichi.kayama@gmail.com>
Language: ja
Language-Team: ja <LL@li.org>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.15.0
  :program:`gdal_edit.py` ã«ã¯,ãã¼ã¿ã»ããã®ã¨ããã¯ãå®ç¾©ãã ``-a_coord_epoch`` ãªãã·ã§ã³ãããã¾ã.  :program:`gdal_translate` ããã³ :program:`ogr2ogr` ã«ã¯, ``-a_srs`` ã¨ä¸ç·ã«ä½¿ç¨ãã ``-a_coord_epoch`` ãªãã·ã§ã³ããã,ããä»¥å¤ã®å ´åã§SRSé¢é£ã®ãªãã·ã§ã³ãæå®ããã¦ããªãå ´åã¯,ã½ã¼ã¹SRSããåºåSRSã«åº§æ¨ã¨ããã¯ãä¿æãã¾ã.   :program:`gdalinfo` ããã³ :program:`ogrinfo` ã¯,ãã¼ã¿ã»ãã/ã¬ã¤ã¤ã¼SRSã«ã¢ã¿ãããããå ´åã«,åº§æ¨ã¨ããã¯ãå ±åãã¾ã.  :program:`gdalwarp` ããã³ :program:`ogr2ogr` ã«ã¯, ``-s_srs`` (resp. ``-t_srs`` ã¨ä¸ç·ã«ä½¿ç¨ãã ``-s_coord_epoch`` ãªãã·ã§ã³ããã,ã½ã¼ã¹(resp. ã¿ã¼ã²ãã)CRSã®åº§æ¨ã¨ããã¯ããªã¼ãã¼ã©ã¤ã/è¨­å®ããããã«ä½¿ç¨ããã¾ã. :program:`gdalwarp` ã¯é©åãªå ´åã«åºåSRSã«åº§æ¨ã¨ããã¯ãä¿æãã¾ã. å·ç­æç¹ã§ã¯,GDAL/OGRã§å¦çãããå½¢å¼ã«ã¯,åº§æ¨ã¨ããã¯ãã¨ã³ã³ã¼ãããæ¨æºåãããæ¹æ³ã¯ããã¾ãã.ãã®ãã,æ¢å­ã®ãªã¼ãã¼ã¨ã§ããã ãå¾æ¹äºææ§ãããããã«ã¨ã³ã³ã¼ãæ¹æ³ãé¸æãã¾ãã.å¯¾å¿ããå¬å¼ä»æ§ããã®æ¦å¿µãèæ®ã«å¥ããããã«é²åããå ´å,ãããã®ã¨ã³ã³ã¼ãã£ã³ã°ã¯å¤æ´ãããå¯è½æ§ãããã¾ã.åº§æ¨ã¨ããã¯ã¯,ä½æãããã¬ã¤ã¤ã¼/ãã¼ã¿ã»ããã®SRSã«ã¢ã¿ãããããå ´åã«ã®ã¿æ¸ãè¾¼ã¾ãã¾ã. PROJ 9.4ä»¥åã§ã¯,2ã¤ã®ãã¤ãããã¯CRSéã®å¤æããµãã¼ããã¦ããªãã£ããã, ``-s_coord_epoch`` ã¨ ``-t_coord_epoch`` ã¯ç¸äºã«æä»çã§ãã. åº§æ¨ã¨ããã¯ã®ãµãã¼ã ãã¤ãããã¯CRSã¨åº§æ¨ã¨ããã¯ åº§æ¨ã¨ããã¯ãé¢é£ä»ãããã¦ããåãã¯ã¿ã¼/ã©ã¹ã¿ã¼ãã¼ãã«ã¯,CRS WKTæ¡å¼µã®æ¡å¼µãã¼ã¸ã§ã³ãä½¿ç¨ãã¦,``gpkg_spatial_ref_sys`` ãã¼ãã«ã® ``epoch`` åã«ã¨ã³ã³ã¼ãããã¾ã(https://github.com/opengeospatial/geopackage/pull/600). ãã¤ãããã¯CRSã®ä¾ã«ã¯, ``WGS 84 (G1762)``, ``ITRF2014``, ``ATRF2014`` ãããã¾ã. ãã¯ãã«å½¢å¼ã®å ´å,ã¸ãªã¡ããªãã¨ã®åº§æ¨ã¨ããã¯ãæå³ããªããã¨ãã§ãã¾ãã,ã»ã¨ãã©ã®å½¢å¼ãã¬ã¤ã¤ã¼ãã¨ã®CRSã®ã¿ããµãã¼ããã¦ãããã,ç¾æç¹ã§ã¯ã¬ã¤ã¤ã¼ã¬ãã«ã§ã®åº§æ¨ã¨ããã¯ã®ãµãã¼ããå¶éãã¦ãã¾ã.åºæ¬ã¨ãªãåº§æ¨å¤æã¡ã«ããºã ã¯,é ç¹ãã¨ã®åº§æ¨ã¨ããã¯ããµãã¼ãã§ãã¾ã. å½¢å¼çã«ã¯,è¦³æ¸¬ã®åº§æ¨ã¨ããã¯ã¯è¦³æ¸¬ã«å±ãã¾ã.ããã,ã»ã¨ãã©ã®å½¢å¼ã§ã¯è¦³æ¸¬ãã¨ã®ã¨ããã¯ãä¿å­ãããã¨ã¯ã§ãã,å¸åçãªä½¿ç¨æ³ã¯åãã¨ããã¯ã®è¦³æ¸¬ã®ã»ããã§ã.ãããã£ã¦,ç§ãã¡ã¯ã¨ããã¯ãCRSã®ãã­ããã£ã¨ãã¦ä¿å­ã,ããããã¹ã¦ã®è¦³æ¸¬ã«æå¹ã§ããã¨ä»®å®ãã¾ã.ãã®é¸æã¯,ã»ã¨ãã©ã®ä½¿ç¨æ³ã«å¯¾ãã¦å¦ç,ä¿å­,å½¢å¼ã®è¤éããç·©åãã¾ã.ç¾æç¹ã§ã¯,ç°ãªãã¨ããã¯ã®è¦³æ¸¬ãç¹ãå«ããã¼ã¿ã»ãããå¦çãããã¨ã¯ã§ãã¾ãã. GeoJP2ããã¯ã¹ã¯ä¸è¨ã®GeoTIFFã¨ã³ã³ã¼ãã£ã³ã°ãä½¿ç¨ãã¾ã. é ç¹ãã¨ã®æéãæå®ããã¦ããå ´å,ããã¯CRSã«é¢é£ä»ããããæéãä¸æ¸ããã¾ã. ãã¤ãããã¯CRSã§ã¯,å°çè¡¨é¢ä¸ã®ç¹ã®åº§æ¨ã¯æéã¨ã¨ãã«å¤åããå¯è½æ§ãããã¾ã.åº§æ¨ãæç¢ºã§ããããã«ã¯,å¸¸ã«æå¹ãªã¨ããã¯ã§åº§æ¨ãä¿®é£¾ããå¿è¦ãããã¾ã.åº§æ¨ã¨ããã¯ã¯,è¦³æ¸¬ãåéãããã¨ããã¯ã§ããå¿è¦ã¯ããã¾ãã. éçCRSã¨ãã¤ãããã¯CRSéã®æéä¾å­å¤æãè¡ãéã«,ãã¤ãããã¯CRSã«é¢é£ä»ããããåº§æ¨ã¨ããã¯ãèæ®ãããã¨ãã§ãã¾ã. :config:`OGR_CT_USE_SRS_COORDINATE_EPOCH` æ§æãªãã·ã§ã³ã ``NO`` ã«è¨­å®ãã¦,ã½ã¼ã¹ã¾ãã¯ã¿ã¼ã²ããCRSã«é¢é£ä»ããããåº§æ¨ã¨ããã¯ãä½¿ç¨ããªãããã«ãããã¨ãã§ãã¾ã. Persistent Auxiliary Metadata (.aux.xml) ãã®ãããªæ§é ã¯,GDAL < 3.4 ã§ã¯çè§£ããã¾ããã,CRSã«é¢é£ä»ããããEPSGã³ã¼ããããå ´å,ããã¯å¤ãGDALãã¼ã¸ã§ã³ã§åé¡ãå¼ãèµ·ããã¾ãã. åº§æ¨å¤æã§ã®ãµãã¼ã ã©ã¹ã¿ã¼ããã³ãã¯ã¿ã¼å½¢å¼ã§ã®ãµãã¼ã ã¦ã¼ãã£ãªãã£ã§ã®ãµãã¼ã  :cpp:class:`OGRCoordinateTransformation` ã¯ã©ã¹ã¯,é ç¹ãã¨ã«æ¸¡ãããåº§æ¨ã¨ããã¯ã«åºã¥ãã¦,éçCRSã¨ãã¤ãããã¯CRSéã®æéä¾å­å¤æãå®è¡ã§ãã¾ã. :cpp:func:`OGRSpatialReference::IsDynamic` ã¡ã½ãããä½¿ç¨ãã¦,CRSããã¤ãããã¯ãã©ããããã¹ãã§ãã¾ã.  :cpp:func:`OGRSpatialReference::SetCoordinateEpoch` ããã³  :cpp:func:`OGRSpatialReference::GetCoordinateEpoch` ã¡ã½ãããä½¿ç¨ãã¦,CRSã«é¢é£ä»ããããåº§æ¨ã¨ããã¯ãè¨­å®/åå¾ã§ãã¾ã.åº§æ¨ã¨ããã¯ã¯,10é²å¹´ã§è¡¨ããã¾ã(ä¾:2021.3ã¯2021å¹´4æ21æ¥). åº§æ¨ã¨ããã¯ã¯, ``SRS`` è¦ç´ ã® ``coordinateEpoch`` å±æ§ã¨ãã¦ã¨ã³ã³ã¼ãããã¾ã. åº§æ¨ã¨ããã¯ã¯,FlatGeoBufãã¡ã¤ã«ã® ``Crs.wkt`` ãããã¼ãã£ã¼ã«ãã«è¨­å®ããã,`COORDINATEMETADATA <http://docs.opengeospatial.org/is/18-010r7/18-010r7.html#130>`__ æ§é ã® ``EPOCH`` ãµããã¼ããä½¿ç¨ãã¦,WKT:2019æå­åã¨ãã¦ã¨ã³ã³ã¼ãããã¾ã. åº§æ¨ã¨ããã¯ã¯,æ°ããGeoTIFF GeoKey, ``CoordinateEpochGeoKey`` (ã³ã¼ã5120,ã¿ã¤ãDOUBLE)ã¨ãã¦ã¨ã³ã³ã¼ãããã¾ã. æ±ç¨EPSG:4326 WGS 84 CRSããã¤ãããã¯ã¨è¦ãªããã¾ãã,ãã®ä½ç½®ç²¾åº¦ã2ã¡ã¼ãã«ã§ãããã¼ã¿ã ã¢ã³ãµã³ãã«ã«åºã¥ãã¦ãããã,ä½¿ç¨ããå§ããã¾ãã.ä»£ããã«, WGS 84 (G1762)ãªã©ã®å®ç¾ã®1ã¤ãä½¿ç¨ãã¦ãã ãã. ãã®ææ¸ã¯ããã¤ãããã¯CRSã«é¢é£ããåº§æ¨ã¨ããã¯ã®ãµãã¼ãã«ã¤ãã¦èª¬æãããã®ã§ã. 