Þ    B      ,              <  ¥  =  b   ã  ^   F  N   ¥  £   ô  Û       t  ê   w	  «  b
  ­     ò   ¼  Ñ  ¯      s     Í   	  7   ×       /        N  º   V  %        7  
  ?  é   J  Ä   4     ù  Ð        ç     ù  (       0  -  9  v  g    Þ     ñ     ÷      ù   $   L  !  @  k"  è  ¬#     %     §%  
  ?&  ©  J'  c   ô(  Æ  X)  f  +    ,  .  -  -  Î.  
  ü/  ¤  1  ^  ¬3  9  5  º  E6  §   8  =   ¨9  A  æ9  ®  (;     ×<  j  w=     â>  ®   ô>  ?  £?    ã@  ;  cB  [   D  `   ûD  O   \E  Û   ¬E    F  q  G  Y  I  "  aJ  Ú   L    _M  9  rN  E  ¬P     òQ    R  Y   S     íS  0   ýS     .T  å   AT  *   'U     RU  f  bU  <  ÉV  ¶   X     ½X  ã   ÓX     ·Y     ÍY  u  éY     _[  l  o[  ö  Ü\  |  Ó`     Pb     ]b    úb    ýd  º  f  ©  Êg  c  ti     Øk     åk  &  yl     m     ¦o  G  )p  ³  qr  f  %t  n  u  f  ûv  O  bx    ²y  ^  C}    ¢~  *  "    M  O   l  v  ¼  Ö  3     
    ¤  !   ¶  ô   Ø  S  Í   :cpp:class:`GDALDataset` is an abstract base class. An implementation is expected to be subclassed for each file format driver implemented. :cpp:class:`GDALDataset` objects are not normally instantiated directly but rather with the assistance of an :cpp:class:`GDALDriver`. Deleting an :cpp:class:`GDALDataset` closes access to the underlying persistent data source, but does not normally result in deletion of that file. :cpp:class:`OGRCodedFieldDomain`, which constrains values those present in a specified enumeration :cpp:class:`OGRGlobFieldDomain`, which constrains values to those matching a specified pattern :cpp:class:`OGRRangeFieldDomain`, which constrains values to a specified range A :cpp:class:`GDALDataset` has a name (usually a filename or database connection string) that can be used to reopen the data source with a :cpp:class:`GDALDriver`. A :cpp:class:`GDALDataset` may also be aware of relationships between layers (e.g., a foreign key relationship between database tables). Information about these relationships is stored in a :cpp:class:`GDALRelationshp`. A :cpp:class:`GDALDataset` represents a set of :cpp:class:`OGRLayer` objects. This usually represents a single file, set of files, database or gateway. A :cpp:class:`GDALDataset` has a list of :cpp:class:`OGRLayer` which it owns but can return references to. A :cpp:class:`GDALDriver` object is instantiated for each file format supported. The :cpp:class:`GDALDriver` objects are registered with the :cpp:class:`GDALDriverManager`, a singleton class that is normally used to open new datasets. Additional intermediate classes contain functionality that is used by multiple geometry types. These include :cpp:class:`OGRCurve` (base class for :cpp:class:`OGRLineString`) and :cpp:class:`OGRSurface` (base class for :cpp:class:`OGRPolygon`). Some intermediate interfaces modeled in the simple features abstract model and SFCOM are not modeled in OGR at this time. In most cases the methods are aggregated into other classes. Additionally, an :cpp:class:`OGRFieldDomain` may define policies describing the values that should be assigned to domain-controlled fields when features are split or merged. An :cpp:class:`OGRLayer` may also store an :cpp:class:`OGRStyleTable` that provides a set of styles that may be used by features in the layer. More information on GDAL's handling of feature styles can be found in the :ref:`ogr_feature_style`. An :cpp:class:`OGRLayer` represents a layer of features within a data source. All features in an :cpp:class:`OGRLayer` share a common schema and are of the same :cpp:class:`OGRFeatureDefn`. An :cpp:class:`OGRLayer` class also contains methods for reading features from the data source. The :cpp:class:`OGRLayer` can be thought of as a gateway for reading and writing features from an underlying data source such as a file on disk, or the result of a database query. Another question that might arise is why the :cpp:class:`OGRLayer` and :cpp:class:`OGRFeatureDefn` classes are distinct. An :cpp:class:`OGRLayer` always has a one-to-one relationship to an :cpp:class:`OGRFeatureDefn`, so why not amalgamate the classes? There are two reasons: Any of the above geometry classes can store coordinates in two (XY), three (XYZ or XYM), or four (XYZM) dimensions. As defined now :cpp:class:`OGRFeature` and :cpp:class:`OGRFeatureDefn` don't depend on :cpp:class:`OGRLayer`, so they can exist independently in memory without regard to a particular layer in a data store. Available types of :cpp:class:`OGRFieldDomain` include: Class Overview Compatibility issues with non-linear geometries Dataset Dataset (:ref:`gdal_priv.h <gdaldataset_cpp>`): A :cpp:class:`GDALDataset` is an abstract base class representing a file or database containing one or more :cpp:class:`OGRLayer` objects. Diagram of OGRGeometry and subclasses Drivers Drivers (:ref:`gdal_priv.h <gdaldriver_cpp>`): A :cpp:class:`GDALDriver` represents a translator for a specific format, capable of opening and possibly writing :cpp:class:`GDALDataset` objects. All available drivers are managed by the :cpp:class:`GDALDriverManager`. Earlier versions of GDAL represented vector datasets using the :cpp:class:`OGRDataSource` class. This class has been maintained for backwards compatibility but is functionally equivalent to a :cpp:class:`GDALDataset` for vector data. Feature (:ref:`ogr_feature.h <ogrfeature_cpp>`): The :cpp:class:`OGRFeature` encapsulates the definition of a whole feature, that is a set of geometries and attributes relating to a single entity. Feature / Feature Definition Feature Class Definition (:ref:`ogr_feature.h <ogrfeature_cpp>`): The :cpp:class:`OGRFeatureDefn` class captures the schema (set of field definitions) for a group of related features (normally a whole layer). Field Definitions Field Domains Generic mechanisms have been introduced so that creating or modifying a feature with a non-linear geometry in a layer of a driver that does not support it will transform that geometry in the closest matching linear geometry. This linearization can be controlled using :ref:`configoptions_vector`. Geometry Geometry (:ref:`ogr_geometry.h <ogrgeometry_cpp>`): The geometry classes (:cpp:class:`OGRGeometry`, etc) encapsulate the OGC vector data types. They provide some geometry operations and translation to/from well known binary and text format. A geometry includes a spatial reference system (projection). Individual geometry classes are used to represent the different types of vector geometry. All the geometry classes derive from :cpp:class:`OGRGeometry` which defines the common functionality of all geometries. Geometry types include :cpp:class:`OGRPoint`, :cpp:class:`OGRLineString`, :cpp:class:`OGRPolygon`, :cpp:class:`OGRGeometryCollection`, :cpp:class:`OGRMultiPoint`, :cpp:class:`OGRMultiLineString`, :cpp:class:`OGRMultiPolygon`, and :cpp:class:`OGRPolyhedralSurface`. The special case of a triangular polygon can be represented as a :cpp:class:`OGRTriangle`, a non-overlapping collection of which can be represented by an :cpp:class:`OGRTriangulatedSurface`. An additional set of types is used to store non-linear geometries: :cpp:class:`OGRCircularString`, :cpp:class:`OGRCompoundCurve`, :cpp:class:`OGRCurvePolygon`, :cpp:class:`OGRMultiCurve` and :cpp:class:`OGRMultiSurface`. It is intended that a new :cpp:class:`GDALDriver` object is instantiated and define function pointers for operations like Identify(), Open() for each file format to be supported (along with a file format specific :cpp:class:`GDALDataset`, and :cpp:class:`OGRLayer` classes). Layer Layer (:ref:`ogrsf_frmts.h <ogrlayer_cpp>`): :cpp:class:`OGRLayer` is an abstract class representing a layer of features in a :cpp:class:`GDALDataset`. On application startup registration functions are normally called for each desired file format. These functions instantiate the appropriate :cpp:class:`GDALDriver` objects, and register them with the :cpp:class:`GDALDriverManager`. When a dataset is to be opened, the driver manager will normally try each :cpp:class:`GDALDataset` in turn, until one succeeds, returning a :cpp:class:`GDALDataset` object. On the other side, when retrieving data from the OGR C API, the :cpp:func:`OGRSetNonLinearGeometriesEnabledFlag` function can be used, so that geometries and layer geometry type returned are also converted to their linear approximation if necessary. One flaw in the current OGR architecture is that the spatial and attribute filters are set directly on the :cpp:class:`OGRLayer` which is intended to be the only representative of a given layer in a data source. This means it isn't possible to have multiple read operations active at one time with different spatial filters on each. Several geometry fields (:cpp:class:`OGRGeomFieldDefn`) can be associated with an :cpp:class:`OGRFeatureDefn`. Each geometry field has its own indicator of geometry type allowed, returned by :cpp:func:`OGRGeomFieldDefn::GetType`, and its spatial reference system, returned by :cpp:func:`OGRGeomFieldDefn::GetSpatialRef`. Some formats support the use of field domains that describe the values that can be stored in a given attribute field. An :cpp:class:`OGRFieldDefn` may reference a single :cpp:class:`OGRFieldDomain` that is associated with a :cpp:class:`GDALDataset`. Programs using GDAL may use the :cpp:class:`OGRFieldDomain` to appropriately constrain user input. GDAL does not perform validation itself and will allow the storage of values that violate a field's associated :cpp:class:`OGRFieldDomain`. Spatial Reference Spatial Reference (:ref:`ogr_spatialref.h <ogrspatialref>`): An :cpp:class:`OGRSpatialReference` encapsulates the definition of a projection and datum. Starting with GDAL 3.6, as an alternative to getting features through ``GetNextFeature``, it is possible to retrieve them by batches, with a column-oriented memory layout, using the :cpp:func:`OGRLayer::GetArrowStream` method (cf :ref:`vector_api_tut_arrow_stream`). The :cpp:class:`GDALDataset` also has support for executing a datasource specific command, normally a form of SQL. This is accomplished via the :cpp:func:`GDALDataset::ExecuteSQL` method. While some datasources (such as PostGIS and Oracle) pass the SQL through to an underlying database, OGR also includes support for evaluating a subset of the SQL SELECT statement against any datasource (see :ref:`ogr_sql_sqlite_dialect`.) The :cpp:class:`OGRFeatureDefn` also contains a feature class name (normally used as a layer name). The :cpp:class:`OGRFeatureDefn` also contains an indicator of the types of geometry allowed for that feature class (returned as an :cpp:enum:`OGRwkbGeometryType` from :cpp:func:`OGRFeatureDefn::GetGeomType`). If this is :cpp:enumerator:`OGRwkbGeometryType::wkbUnknown` then any type of geometry is allowed. This implies that features in a given layer can potentially be of different geometry types though they will always share a common attribute schema. The :cpp:class:`OGRFieldDefn` can also track whether a field is allowed to be null (:cpp:func:`OGRFieldDefn::IsNullable`), whether its value must be unique (:cpp:func:`OGRFieldDefn::IsUnique`), and formatting information such as the number of decimal digits, width, and justification. It may also define a default value in case one is not manually specified. The :cpp:class:`OGRGeometryFactory` is used to convert well known text (WKT) and well known binary (WKB) format data into the appropriate :cpp:class:`OGRGeometry` subclass. These are predefined ASCII and binary formats for representing all the types of simple features geometries. The :cpp:class:`OGRGeometry` captures the geometry of a vector feature. The :cpp:class:`OGRFeature` contains geometry, and adds feature attributes, feature id, and a feature class identifier. It may also contain styling information. Several geometries can be associated with an :cpp:class:`OGRFeature`. The :cpp:class:`OGRGeometry` includes a reference to an :cpp:class:`OGRSpatialReference` object, defining the spatial reference system of that geometry. This is normally a reference to a shared spatial reference object with reference counting for each of the :cpp:class:`OGRGeometry` objects using it. The :cpp:class:`OGRLayer` class is an abstract base class. An implementation is expected to be subclassed for each file format driver implemented. OGRLayers are normally owned directly by their :cpp:class:`GDALDataset`, and aren't instantiated or destroyed directly. The :cpp:class:`OGRLayer` includes methods for sequential and random reading and writing. Read access (via the :cpp:func:`OGRLayer::GetNextFeature` method) normally reads all features, one at a time sequentially; however, it can be limited to return features intersecting a particular geographic region by installing a spatial filter on the :cpp:class:`OGRLayer` (via the :cpp:func:`OGRLayer::SetSpatialFilter` method). A filter on attributes can only be set with the :cpp:func:`OGRLayer::SetAttributeFilter` method. By default, all available attributes and geometries are read but this can be controlled by flagging fields as ignored (:cpp:func:`OGRLayer::SetIgnoredFields`). The :cpp:class:`OGRSpatialReference` class is intended to store an OpenGIS Spatial Reference System definition. Currently local, geographic and projected coordinate systems are supported. Vertical coordinate systems, geocentric coordinate systems, and compound (horizontal + vertical) coordinate systems are as well supported in recent GDAL versions. The SF CORBA model does not have a concept of a layer with a single fixed schema the way that the SFCOM and SFSQL models do. The fact that features belong to a feature collection that is potentially not directly related to their current feature grouping may be important to implementing SFCORBA support using OGR. The behavior of each field in a feature class is defined by a shared :cpp:class:`OGRFieldDefn`. The :cpp:class:`OGRFieldDefn` specifies the field type from the values of :cpp:enum:`OGRFieldType`. Values stored in this field may be further restricted according to a :cpp:enum:`OGRFieldSubType`. For example, a field may have a type of :cpp:enumerator:`OGRFieldType::OFTInteger` with a subtype of :cpp:enumerator:`OGRFieldSubType::OFSTBoolean`. The feature id (FID) of a feature is intended to be a unique identifier for the feature within the layer it is a member of. Freestanding features, or features not yet written to a layer may have a null (OGRNullFID) feature id. The feature ids are modeled in OGR as a 64-bit integer; however, this is not sufficiently expressive to model the natural feature ids in some formats. For instance, the GML feature id is a string. The following classes form the core of the vector data model: The set of attributes (:cpp:class:`OGRFieldDefn`), their types, names and so forth is represented via the :cpp:class:`OGRFeatureDefn` class. One :cpp:class:`OGRFeatureDefn` normally exists for a layer of features. The same definition is shared in a reference counted manner by the feature of that type (or feature class). The spatial coordinate system data model is inherited from the OpenGIS Well Known Text format. A simple form of this is defined in the Simple Features specifications. A more sophisticated form is found in the Coordinate Transformation specification. The :cpp:class:`OGRSpatialReference` is built on the features of the Coordinate Transformation specification but is intended to be compatible with the earlier simple features form. There is also an associated :cpp:class:`OGRCoordinateTransformation` class that encapsulates use of |PROJ| for converting between different coordinate systems. This page documents the classes used to handle vector data. Many data types and method names are based on the OGC Simple Features data model, so it may be helpful to review the `specifications published by OGC <https://www.ogc.org/standard/sfa/>`__. For historical reasons, GDAL uses the "OGR" prefix to denote types and functions that apply only to vector data. Vector Data Model When using some drivers, the :cpp:class:`GDALDataset` also offers a mechanism for to start, commit, and rollback transactions when interacting with the underlying data store. While it is theoretically possible to derive other or more specific geometry classes from the existing :cpp:class:`OGRGeometry` classes, this isn't an aspect that has been well thought out. In particular, it would be possible to create specialized classes using the :cpp:class:`OGRGeometryFactory` without modifying it. Project-Id-Version: GDAL 
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
 :cpp:class:`GDALDataset` ã¯æ½è±¡åºåºã¯ã©ã¹ã§ã. å®è£ã¯, å®è£ãããåãã¡ã¤ã«å½¢å¼ãã©ã¤ãã¼ã«å¯¾ãã¦ãµãã¯ã©ã¹åããããã¨ãæå¾ããã¦ãã¾ã. :cpp:class:`GDALDataset` ãªãã¸ã§ã¯ãã¯éå¸¸, ç´æ¥ã¤ã³ã¹ã¿ã³ã¹åãããã®ã§ã¯ãªã, :cpp:class:`GDALDriver` ã®æ¯æ´ãåãã¦ã¤ã³ã¹ã¿ã³ã¹åããã¾ã. :cpp:class:`GDALDataset` ãåé¤ããã¨, ä¸ä½ã®æ°¸ç¶ãã¼ã¿ã½ã¼ã¹ã¸ã®ã¢ã¯ã»ã¹ãéãããã¾ãã, éå¸¸, ãã®ãã¡ã¤ã«ãåé¤ããããã¨ã¯ããã¾ãã. :cpp:class:`OGRCodedFieldDomain`, æå®ãããåæã«å­å¨ããå¤ãå¶ç´ãã¾ã :cpp:class:`OGRGlobFieldDomain`, æå®ããããã¿ã¼ã³ã«ä¸è´ããå¤ãå¶ç´ãã¾ã :cpp:class:`OGRRangeFieldDomain`, æå®ãããç¯å²ã®å¤ãå¶ç´ãã¾ã :cpp:class:`GDALDataset` ã«ã¯, ãã¼ã¿ã½ã¼ã¹ã :cpp:class:`GDALDriver` ã§åãªã¼ãã³ããããã«ä½¿ç¨ã§ããåå (éå¸¸ã¯ãã¡ã¤ã«åã¾ãã¯ãã¼ã¿ãã¼ã¹æ¥ç¶æå­å) ãããã¾ã. :cpp:class:`GDALDataset` ã¯, ã¬ã¤ã¤ã¼éã®é¢ä¿ (ãã¨ãã°, ãã¼ã¿ãã¼ã¹ãã¼ãã«éã®å¤é¨ã­ã¼é¢ä¿) ã«ã¤ãã¦ãèªè­ãããã¨ãã§ãã¾ã. ãããã®é¢ä¿ã«é¢ããæå ±ã¯, :cpp:class:`GDALRelationshp` ã«æ ¼ç´ããã¾ã. :cpp:class:`GDALDataset` ã¯, :cpp:class:`OGRLayer` ãªãã¸ã§ã¯ãã®ã»ãããè¡¨ãã¾ã. ããã¯éå¸¸, åä¸ã®ãã¡ã¤ã«, ãã¡ã¤ã«ã»ãã, ãã¼ã¿ãã¼ã¹, ã¾ãã¯ã²ã¼ãã¦ã§ã¤ãè¡¨ãã¾ã. :cpp:class:`GDALDataset` ã«ã¯, ææãã¦ãã :cpp:class:`OGRLayer` ã®ãªã¹ããããã¾ãã, åç§ãè¿ããã¨ãã§ãã¾ã. ãµãã¼ãããã¦ããåãã¡ã¤ã«å½¢å¼ã«å¯¾ãã¦ :cpp:class:`GDALDriver` ãªãã¸ã§ã¯ããã¤ã³ã¹ã¿ã³ã¹åããã¾ã. éå¸¸, æ°ãããã¼ã¿ã»ãããéãããã«ä½¿ç¨ãããã·ã³ã°ã«ãã³ã¯ã©ã¹ã§ãã :cpp:class:`GDALDriverManager` ã« :cpp:class:`GDALDriver` ãªãã¸ã§ã¯ããç»é²ããã¾ã. è¤æ°ã®ã¸ãªã¡ããªã¿ã¤ãã§ä½¿ç¨ãããæ©è½ãå«ãè¿½å ã®ä¸­éã¯ã©ã¹ãããã¾ã. ãããã«ã¯, :cpp:class:`OGRCurve` (:cpp:class:`OGRLineString` ã®åºæ¬ã¯ã©ã¹) ã¨ :cpp:class:`OGRSurface` (:cpp:class:`OGRPolygon` ã®åºæ¬ã¯ã©ã¹) ãå«ã¾ãã¾ã. ã·ã³ãã«ãã£ã¼ãã£æ½è±¡ã¢ãã«ã¨ SFCOM ã§ã¢ãã«åãããããã¤ãã®ä¸­éã¤ã³ã¿ãã§ã¼ã¹ã¯, ãã®æç¹ã§ã¯ OGR ã§ã¢ãã«åããã¦ãã¾ãã. ã»ã¨ãã©ã®å ´å, ã¡ã½ããã¯ä»ã®ã¯ã©ã¹ã«éç´ããã¾ã. ããã«, :cpp:class:`OGRFieldDomain` ã¯, å°ç©ãåå²ã¾ãã¯çµåãããã¨ãã«, ãã¡ã¤ã³å¶å¾¡ãã£ã¼ã«ãã«å²ãå½ã¦ãã¹ãå¤ãè¨è¿°ããããªã·ã¼ãå®ç¾©ãããã¨ãã§ãã¾ã. :cpp:class:`OGRLayer` ã«ã¯, ã¬ã¤ã¤ã¼åã®å°ç©ã§ä½¿ç¨ã§ããã¹ã¿ã¤ã«ã»ãããæä¾ãã :cpp:class:`OGRStyleTable` ãæ ¼ç´ãããã¨ãã§ãã¾ã. å°ç©ã¹ã¿ã¤ã«ã® GDAL ã®å¦çã«é¢ããè©³ç´°ã¯, :ref:`ogr_feature_style` ã«ããã¾ã. :cpp:class:`OGRLayer` ã¯, ãã¼ã¿ã½ã¼ã¹åã®å°ç©ã¬ã¤ã¤ã¼ãè¡¨ãã¾ã. :cpp:class:`OGRLayer` åã®ãã¹ã¦ã®å°ç©ã¯å±éã®ã¹ã­ã¼ããå±æã, åã :cpp:class:`OGRFeatureDefn` ã§ã. :cpp:class:`OGRLayer` ã¯ã©ã¹ã«ã¯, ãã¼ã¿ã½ã¼ã¹ããå°ç©ãèª­ã¿åãããã®ã¡ã½ãããå«ã¾ãã¦ãã¾ã. :cpp:class:`OGRLayer` ã¯, ãã£ã¹ã¯ä¸ã®ãã¡ã¤ã«ããã¼ã¿ãã¼ã¹ã¯ã¨ãªã®çµæãªã©, ä¸ä½ã®ãã¼ã¿ã½ã¼ã¹ããå°ç©ãèª­ã¿æ¸ãããããã®ã²ã¼ãã¦ã§ã¤ã¨èãããã¨ãã§ãã¾ã. ãã 1 ã¤ã®çåã¯, ãªã :cpp:class:`OGRLayer` ã¨ :cpp:class:`OGRFeatureDefn` ã¯ã©ã¹ãç°ãªãã®ãã¨ãããã¨ã§ã. :cpp:class:`OGRLayer` ã¯å¸¸ã« :cpp:class:`OGRFeatureDefn` ã¨ã®ä¸å¯¾ä¸ã®é¢ä¿ãæã¤ãã, ãªãã¯ã©ã¹ãçµ±åããªãã®ã§ãããã? ãã®çç±ã¯ 2 ã¤ããã¾ã: ä¸è¨ã®ããããã®ã¸ãªã¡ããªã¯ã©ã¹ã¯, 2 (XY), 3 (XYZ ã¾ãã¯ XYM), ã¾ãã¯ 4 (XYZM) æ¬¡åã§åº§æ¨ãæ ¼ç´ãããã¨ãã§ãã¾ã. ç¾å¨ã®å®ç¾©ã§ã¯, :cpp:class:`OGRFeature` ã¨ :cpp:class:`OGRFeatureDefn` ã¯ :cpp:class:`OGRLayer` ã«ä¾å­ãã¦ããªããã, ãã¼ã¿ã¹ãã¢åã®ç¹å®ã®ã¬ã¤ã¤ã¼ã«é¢ä¿ãªã, ã¡ã¢ãªåã§ç¬ç«ãã¦å­å¨ãããã¨ãã§ãã¾ã. :cpp:class:`OGRFieldDomain` ã®å©ç¨å¯è½ãªã¿ã¤ãã«ã¯æ¬¡ã®ãã®ãããã¾ã: ã¯ã©ã¹æ¦è¦ éç·å½¢ã¸ãªã¡ããªã¨ã®äºææ§ã®åé¡ ãã¼ã¿ã»ãã ãã¼ã¿ã»ãã (:ref:`gdal_priv.h <gdaldataset_cpp>`): :cpp:class:`GDALDataset` ã¯, 1 ã¤ä»¥ä¸ã® :cpp:class:`OGRLayer` ãªãã¸ã§ã¯ããå«ããã¡ã¤ã«ã¾ãã¯ãã¼ã¿ãã¼ã¹ãè¡¨ãæ½è±¡åºåºã¯ã©ã¹ã§ã. OGRGeometry ããã³ãµãã¯ã©ã¹ã®å³ ãã©ã¤ãã¼ ãã©ã¤ãã¼ (:ref:`gdal_priv.h <gdaldriver_cpp>`): :cpp:class:`GDALDriver` ã¯, ç¹å®ã®å½¢å¼ã®ããã®å¤æãã­ã°ã©ã ãè¡¨ã, :cpp:class:`GDALDataset` ãªãã¸ã§ã¯ããéããã, æ¸ãè¾¼ãã ããããã¨ãã§ãã¾ã. å©ç¨å¯è½ãªãã¹ã¦ã®ãã©ã¤ãã¼ã¯ :cpp:class:`GDALDriverManager` ã«ãã£ã¦ç®¡çããã¾ã. ä»¥åã®ãã¼ã¸ã§ã³ã® GDAL ã§ã¯, ãã¯ã¿ã¼ãã¼ã¿ã»ããã :cpp:class:`OGRDataSource` ã¯ã©ã¹ãä½¿ç¨ãã¦è¡¨ç¾ãã¦ãã¾ãã. ãã®ã¯ã©ã¹ã¯å¾æ¹äºææ§ã®ããã«ç¶­æããã¦ãã¾ãã, ãã¯ã¿ã¼ãã¼ã¿ã«å¯¾ãã¦ã¯ :cpp:class:`GDALDataset` ã¨æ©è½çã«åç­ã§ã. å°ç© (:ref:`ogr_feature.h <ogrfeature_cpp>`): :cpp:class:`OGRFeature` ã¯, 1 ã¤ã®ã¨ã³ãã£ãã£ã«é¢é£ããã¸ãªã¡ããªã¨å±æ§ã®ã»ãããã«ãã»ã«åãã¾ã. å°ç© / å°ç©å®ç¾© å°ç©ã¯ã©ã¹å®ç¾© (:ref:`ogr_feature.h <ogrfeature_cpp>`): :cpp:class:`OGRFeatureDefn` ã¯ã©ã¹ã¯, é¢é£ããå°ç©ã®ã¹ã­ã¼ã(ãã£ã¼ã«ãå®ç¾©ã®ã»ãã)ãã­ã£ããã£ãã¾ã(éå¸¸ã¯å¨ã¬ã¤ã¤ã¼). ãã£ã¼ã«ãå®ç¾© ãã£ã¼ã«ããã¡ã¤ã³ éç·å½¢ã¸ãªã¡ããªãæã¤ã¬ã¤ã¤ã¼ã®ãã©ã¤ãã¼ã§éç·å½¢ã¸ãªã¡ããªãæã¤å°ç©ãä½æã¾ãã¯å¤æ´ããã¨, ãã®ã¸ãªã¡ããªãæãè¿ãä¸è´ããç·å½¢ã¸ãªã¡ããªã«å¤æãããããã«, ä¸è¬çãªã¡ã«ããºã ãå°å¥ããã¾ãã. ãã®ç·å½¢åã¯, :ref:`configoptions_vector` ãä½¿ç¨ãã¦å¶å¾¡ã§ãã¾ã. ã¸ãªã¡ããª ã¸ãªã¡ããª (:ref:`ogr_geometry.h <ogrgeometry_cpp>`): ã¸ãªã¡ããªã¯ã©ã¹ (:cpp:class:`OGRGeometry`, ãªã©) ã¯ OGC ãã¯ã¿ã¼ãã¼ã¿åãã«ãã»ã«åãã¾ã. ããã¤ãã®ã¸ãªã¡ããªæä½ã¨, æ¢ç¥ã®ãã¤ããªããã³ãã­ã¹ãå½¢å¼ã¸ã®å¤æãæä¾ãã¾ã. ã¸ãªã¡ããªã«ã¯ç©ºéåç§ç³»(æå½±)ãå«ã¾ãã¾ã. åãã®ã¸ãªã¡ããªã¯ã©ã¹ã¯, ç°ãªãç¨®é¡ã®ãã¯ã¿ã¼ã¸ãªã¡ããªãè¡¨ãããã«ä½¿ç¨ããã¾ã. ãã¹ã¦ã®ã¸ãªã¡ããªã¯ã©ã¹ã¯, ãã¹ã¦ã®ã¸ãªã¡ããªã®å±éæ©è½ãå®ç¾©ãã :cpp:class:`OGRGeometry` ããæ´¾çãã¦ãã¾ã. ã¸ãªã¡ããªã¿ã¤ãã«ã¯, :cpp:class:`OGRPoint`, :cpp:class:`OGRLineString`, :cpp:class:`OGRPolygon`, :cpp:class:`OGRGeometryCollection`, :cpp:class:`OGRMultiPoint`, :cpp:class:`OGRMultiLineString`, :cpp:class:`OGRMultiPolygon`, :cpp:class:`OGRPolyhedralSurface` ãå«ã¾ãã¾ã. ä¸è§å½¢ããªã´ã³ã®ç¹æ®ãªå ´åã¯ :cpp:class:`OGRTriangle` ã¨ãã¦è¡¨ããã¨ãã§ã, ãã®ééè¤ã³ã¬ã¯ã·ã§ã³ã¯ :cpp:class:`OGRTriangulatedSurface` ã§è¡¨ããã¨ãã§ãã¾ã. éç·å½¢ã¸ãªã¡ããªãæ ¼ç´ããããã«è¿½å ã®ã¿ã¤ããä½¿ç¨ããã¾ã: :cpp:class:`OGRCircularString`, :cpp:class:`OGRCompoundCurve`, :cpp:class:`OGRCurvePolygon`, :cpp:class:`OGRMultiCurve`, :cpp:class:`OGRMultiSurface` ã§ã. æ°ãã :cpp:class:`GDALDriver` ãªãã¸ã§ã¯ãã, ãµãã¼ããããåãã¡ã¤ã«å½¢å¼ã«å¯¾ãã¦ Identify(), Open() ãªã©ã®æä½ã®ããã®é¢æ°ãã¤ã³ã¿ãå®ç¾©ã, ã¤ã³ã¹ã¿ã³ã¹åããããã¨ãæå³ããã¦ãã¾ã (:cpp:class:`GDALDataset` ããã³ :cpp:class:`OGRLayer` ã¯ã©ã¹ãå«ããã¡ã¤ã«å½¢å¼åºæã®ã¯ã©ã¹ã¨ã¨ãã«). ã¬ã¤ã¤ã¼ ã¬ã¤ã¤ã¼ (:ref:`ogrsf_frmts.h <ogrlayer_cpp>`): :cpp:class:`OGRLayer` ã¯, :cpp:class:`GDALDataset` ã®å°ç©ã¬ã¤ã¤ã¼ãè¡¨ãæ½è±¡ã¯ã©ã¹ã§ã. ã¢ããªã±ã¼ã·ã§ã³ã®èµ·åæã«ã¯, åææã®ãã¡ã¤ã«å½¢å¼ã«å¯¾ãã¦ç»é²é¢æ°ãéå¸¸å¼ã³åºããã¾ã. ãããã®é¢æ°ã¯é©åãª :cpp:class:`GDALDriver` ãªãã¸ã§ã¯ããã¤ã³ã¹ã¿ã³ã¹åã, ãããã :cpp:class:`GDALDriverManager` ã«ç»é²ãã¾ã. ãã¼ã¿ã»ãããéãã¨ãã«ã¯, ãã©ã¤ãã¼ããã¼ã¸ã£ã¯éå¸¸, 1 ã¤ãã¤å :cpp:class:`GDALDataset` ãè©¦ã, æåããã¾ã§ç¶ã, :cpp:class:`GDALDataset` ãªãã¸ã§ã¯ããè¿ãã¾ã. ä¸æ¹, OGR C API ãããã¼ã¿ãåå¾ããå ´å, :cpp:func:`OGRSetNonLinearGeometriesEnabledFlag` é¢æ°ãä½¿ç¨ãã¦, å¿è¦ã«å¿ãã¦ã¸ãªã¡ããªã¨ã¬ã¤ã¤ã¼ã®ã¸ãªã¡ããªã¿ã¤ããç·å½¢è¿ä¼¼ã«å¤æãããããã«ãããã¨ãã§ãã¾ã. ç¾å¨ã® OGR ã¢ã¼ã­ãã¯ãã£ã®æ¬ ç¹ã® 1 ã¤ã¯, ç©ºéãã£ã«ã¿ã¨å±æ§ãã£ã«ã¿ã, ãã¼ã¿ã½ã¼ã¹åã®ç¹å®ã®ã¬ã¤ã¤ã¼ã®å¯ä¸ã®ä»£è¡¨ã§ãããã¨ãæå³ãã¦ãã :cpp:class:`OGRLayer` ã«ç´æ¥è¨­å®ããã¦ãããã¨ã§ã. ããã¯, åãã«ç°ãªãç©ºéãã£ã«ã¿ãè¨­å®ãããè¤æ°ã®èª­ã¿åãæä½ãåæã«ã¢ã¯ãã£ãã«ãããã¨ãã§ããªããã¨ãæå³ãã¾ã. è¤æ°ã®ã¸ãªã¡ããªãã£ã¼ã«ã (:cpp:class:`OGRGeomFieldDefn`) ã :cpp:class:`OGRFeatureDefn` ã«é¢é£ä»ãããã¨ãã§ãã¾ã. åã¸ãªã¡ããªãã£ã¼ã«ãã«ã¯, ãã®è¨±å¯ããã¦ããã¸ãªã¡ããªã¿ã¤ãã®æç¤ºå­ããã, :cpp:func:`OGRGeomFieldDefn::GetType` ã«ãã£ã¦è¿ãã, ãã®ç©ºéåç§ç³»ããã, :cpp:func:`OGRGeomFieldDefn::GetSpatialRef` ã«ãã£ã¦è¿ããã¾ã. ä¸é¨ã®å½¢å¼ã¯, ç¹å®ã®å±æ§ãã£ã¼ã«ãã«æ ¼ç´ã§ããå¤ãè¨è¿°ãããã£ã¼ã«ããã¡ã¤ã³ã®ä½¿ç¨ããµãã¼ããã¦ãã¾ã. :cpp:class:`OGRFieldDefn` ã¯, :cpp:class:`GDALDataset` ã«é¢é£ä»ããããåä¸ã® :cpp:class:`OGRFieldDomain` ãåç§ãããã¨ãã§ãã¾ã. GDALãä½¿ç¨ãããã­ã°ã©ã ã¯, :cpp:class:`OGRFieldDomain` ãä½¿ç¨ãã¦ã¦ã¼ã¶ã¼å¥åãé©åã«å¶ç´ãããã¨ãã§ãã¾ã. GDAL ã¯èªä½ã§æ¤è¨¼ãå®è¡ãã, ãã£ã¼ã«ãã«é¢é£ä»ãããã :cpp:class:`OGRFieldDomain` ãéåããå¤ã®æ ¼ç´ãè¨±å¯ãã¾ã. ç©ºéåç§ ç©ºéåç§ (:ref:`ogr_spatialref.h <ogrspatialref>`): :cpp:class:`OGRSpatialReference` ã¯æå½±ã¨æ¸¬å°ç³»ã®å®ç¾©ãã«ãã»ã«åãã¾ã. GDAL 3.6 ä»¥é, ``GetNextFeature`` ãä»ãã¦å°ç©ãåå¾ããä»£ããã«, :cpp:func:`OGRLayer::GetArrowStream` ã¡ã½ãããä½¿ç¨ãã¦, ãããã§å°ç©ãåå¾ã, åæåã®ã¡ã¢ãªã¬ã¤ã¢ã¦ãã§åå¾ãããã¨ãã§ãã¾ã (cf :ref:`vector_api_tut_arrow_stream`). :cpp:class:`GDALDataset` ã«ã¯, éå¸¸ SQL ã®å½¢å¼ã®ãã¼ã¿ã½ã¼ã¹åºæã®ã³ãã³ããå®è¡ãããµãã¼ããããã¾ã. ããã¯, :cpp:func:`GDALDataset::ExecuteSQL` ã¡ã½ãããä»ãã¦å®è¡ããã¾ã. ä¸é¨ã®ãã¼ã¿ã½ã¼ã¹ (PostGIS ã Oracle ãªã©) ã¯ SQL ãä¸ä½ã®ãã¼ã¿ãã¼ã¹ã«æ¸¡ãã¾ãã, OGR ã¯ä»»æã®ãã¼ã¿ã½ã¼ã¹ã«å¯¾ãã¦ SQL SELECT æã®ãµãã»ãããè©ä¾¡ãããµãã¼ããæä¾ãã¦ãã¾ã (:ref:`ogr_sql_sqlite_dialect` ãåç§). :cpp:class:`OGRFeatureDefn` ã«ã¯, å°ç©ã¯ã©ã¹å (éå¸¸ã¯ã¬ã¤ã¤ã¼åã¨ãã¦ä½¿ç¨ããã)ãå«ã¾ãã¦ãã¾ã. :cpp:class:`OGRFeatureDefn` ã«ã¯, ãã®å°ç©ã¯ã©ã¹ã«è¨±å¯ããã¦ããã¸ãªã¡ããªã®ã¿ã¤ãã®æç¤ºå­ãå«ã¾ãã¦ãã¾ã (:cpp:func:`OGRFeatureDefn::GetGeomType` ãã :cpp:enum:`OGRwkbGeometryType` ã¨ãã¦è¿ããã¾ã). ããã :cpp:enumerator:`OGRwkbGeometryType::wkbUnknown` ã®å ´å, ä»»æã®ã¿ã¤ãã®ã¸ãªã¡ããªãè¨±å¯ããã¾ã. ããã¯, ä¸ããããã¬ã¤ã¤ã¼ã®å°ç©ãç°ãªãã¸ãªã¡ããªã¿ã¤ãã§ããå¯è½æ§ããããã¨ãæå³ãã¾ãã, ãããã¯å¸¸ã«å±éã®å±æ§ã¹ã­ã¼ããå±æãã¾ã. :cpp:class:`OGRFieldDefn` ã¯, ãã£ã¼ã«ãã null ã«è¨±å¯ããã¦ãããã©ãã (:cpp:func:`OGRFieldDefn::IsNullable`), ãã®å¤ãä¸æã§ããå¿è¦ããããã©ãã (:cpp:func:`OGRFieldDefn::IsUnique`), ããã³å°æ°æ¡æ°, å¹, ããã³æ´åãªã©ã®ãã©ã¼ãããæå ±ãè¿½è·¡ãããã¨ãã§ãã¾ã. æåã§æå®ããã¦ããªãå ´å, ããã©ã«ãå¤ãå®ç¾©ãããã¨ãã§ãã¾ã. :cpp:class:`OGRGeometryFactory` ã¯, well known text (WKT) ããã³ well known binary(WKB) å½¢å¼ã®ãã¼ã¿ãé©åãª :cpp:class:`OGRGeometry` ãµãã¯ã©ã¹ã«å¤æããããã«ä½¿ç¨ããã¾ã. ãããã¯, ãã¹ã¦ã®ã·ã³ãã«ãã£ã¼ãã£ã¸ãªã¡ããªã®ç¨®é¡ãè¡¨ãããã®äºåå®ç¾©ã® ASCII ããã³ãã¤ããªå½¢å¼ã§ã. :cpp:class:`OGRGeometry` ã¯ãã¯ã¿ã¼å°ç©ã®ã¸ãªã¡ããªãã­ã£ããã£ãã¾ã. :cpp:class:`OGRFeature` ã¯ã¸ãªã¡ããªãå«ã¿, å°ç©å±æ§, å°ç© ID, ããã³å°ç©ã¯ã©ã¹è­å¥å­ãè¿½å ãã¾ã. ã¹ã¿ã¤ã«æå ±ãå«ããã¨ãã§ãã¾ã. è¤æ°ã®ã¸ãªã¡ããªã :cpp:class:`OGRFeature` ã«é¢é£ä»ãããã¨ãã§ãã¾ã. :cpp:class:`OGRGeometry` ã«ã¯, ãã®ã¸ãªã¡ããªã®ç©ºéåç§ç³»ãå®ç¾©ãã :cpp:class:`OGRSpatialReference` ãªãã¸ã§ã¯ãã¸ã®åç§ãå«ã¾ãã¦ãã¾ã. ããã¯, éå¸¸, ãããä½¿ç¨ããå :cpp:class:`OGRGeometry` ãªãã¸ã§ã¯ãã«å¯¾ãã¦åç§ã«ã¦ã³ããæã¤å±æç©ºéåç§ãªãã¸ã§ã¯ãã¸ã®åç§ã§ã. :cpp:class:`OGRLayer` ã¯ã©ã¹ã¯æ½è±¡åºåºã¯ã©ã¹ã§ã. å®è£ã¯, å®è£ãããåãã¡ã¤ã«å½¢å¼ãã©ã¤ãã¼ã«å¯¾ãã¦ãµãã¯ã©ã¹åããããã¨ãæå¾ããã¦ãã¾ã. OGRLayer ã¯éå¸¸, ç´æ¥ :cpp:class:`GDALDataset` ã«ãã£ã¦ææãã, ç´æ¥ã¤ã³ã¹ã¿ã³ã¹åã¾ãã¯ç ´æ£ããã¾ãã. :cpp:class:`OGRLayer` ã«ã¯, é æ¬¡ããã³ã©ã³ãã ãªèª­ã¿åãããã³æ¸ãè¾¼ã¿ã®ããã®ã¡ã½ãããå«ã¾ãã¦ãã¾ã. èª­ã¿åãã¢ã¯ã»ã¹ (:cpp:func:`OGRLayer::GetNextFeature` ã¡ã½ãããä»ãã¦) ã¯éå¸¸, 1 åã« 1 ã¤ãã¤ãã¹ã¦ã®å°ç©ãé æ¬¡èª­ã¿åãã¾ã; ãã ã, :cpp:class:`OGRLayer` ã«ç©ºéãã£ã«ã¿ãè¨­å®ãããã¨ã§, ç¹å®ã®å°ççé åã«äº¤å·®ããå°ç©ãè¿ãããã«å¶éãããã¨ãã§ãã¾ã (:cpp:func:`OGRLayer::SetSpatialFilter` ã¡ã½ãããä»ãã¦). å±æ§ã«å¯¾ãããã£ã«ã¿ã¯, :cpp:func:`OGRLayer::SetAttributeFilter` ã¡ã½ããã§ã®ã¿è¨­å®ã§ãã¾ã. ããã©ã«ãã§ã¯, ãã¹ã¦ã®å©ç¨å¯è½ãªå±æ§ã¨ã¸ãªã¡ããªãèª­ã¿åããã¾ãã, ããã¯ãã£ã¼ã«ããç¡è¦ããããã«ãã©ã°ãç«ã¦ããã¨ã§å¶å¾¡ã§ãã¾ã (:cpp:func:`OGRLayer::SetIgnoredFields`). :cpp:class:`OGRSpatialReference` ã¯ã©ã¹ã¯, OpenGIS ç©ºéåç§ç³»å®ç¾©ãæ ¼ç´ãããã¨ãæå³ãã¦ãã¾ã. ç¾å¨, ã­ã¼ã«ã«, å°çç, æå½±åº§æ¨ç³»ããµãã¼ãããã¦ãã¾ã. åç´åº§æ¨ç³», å°å¿åº§æ¨ç³», ããã³è¤å(æ°´å¹³ + åç´)åº§æ¨ç³»ã, æè¿ã® GDAL ãã¼ã¸ã§ã³ã§ãµãã¼ãããã¦ãã¾ã. SF CORBA ã¢ãã«ã«ã¯, SFCOM ããã³ SFSQL ã¢ãã«ã®ããã«, åä¸ã®åºå®ã¹ã­ã¼ããæã¤ã¬ã¤ã¤ã¼ã®æ¦å¿µãããã¾ãã. å°ç©ãç¾å¨ã®å°ç©ã°ã«ã¼ãã«ç´æ¥é¢é£ãã¦ããªãå¯è½æ§ã®ããå°ç©ã³ã¬ã¯ã·ã§ã³ã«å±ãã¦ããã¨ããäºå®ã¯, OGR ãä½¿ç¨ãã¦ SFCORBA ãµãã¼ããå®è£ããéã«éè¦ããããã¾ãã. å°ç©ã¯ã©ã¹ã®åãã£ã¼ã«ãã®åä½ã¯, å±æããã :cpp:class:`OGRFieldDefn` ã«ãã£ã¦å®ç¾©ããã¾ã. :cpp:class:`OGRFieldDefn` ã¯, :cpp:enum:`OGRFieldType` ã®å¤ãããã£ã¼ã«ãã¿ã¤ããæå®ãã¾ã. ãã®ãã£ã¼ã«ãã«æ ¼ç´ãããå¤ã¯, :cpp:enum:`OGRFieldSubType` ã«å¾ã£ã¦ããã«å¶éãããå ´åãããã¾ã. ãã¨ãã°, ãã£ã¼ã«ãã¯, :cpp:enumerator:`OGRFieldType::OFTInteger` ã¿ã¤ãã§, :cpp:enumerator:`OGRFieldSubType::OFSTBoolean` ãµãã¿ã¤ããæã¤ãã¨ãããã¾ã. å°ç©ã®å°ç© ID (FID) ã¯, ãã®å°ç©ãæå±ããã¬ã¤ã¤ã¼åã§ã®å°ç©ã®ä¸æã®è­å¥å­ã§ãããã¨ãæå³ãã¦ãã¾ã. ç¬ç«ããå°ç©, ã¾ãã¯ã¾ã ã¬ã¤ã¤ã¼ã«æ¸ãè¾¼ã¾ãã¦ããªãå°ç©ã¯, null (OGRNullFID) å°ç© ID ãæã¤ãã¨ãã§ãã¾ã. å°ç© ID ã¯ OGR ã§ 64 ãããæ´æ°ã¨ãã¦ã¢ãã«åããã¦ãã¾ãã, ããã¯ä¸é¨ã®å½¢å¼ã®èªç¶ãªå°ç© ID ãã¢ãã«åããã«ã¯ååãªè¡¨ç¾åãæã£ã¦ãã¾ãã. ãã¨ãã°, GML å°ç© ID ã¯æå­åã§ã. ä»¥ä¸ã®ã¯ã©ã¹ããã¯ã¿ã¼ãã¼ã¿ã¢ãã«ã®ä¸­æ ¸ãå½¢æãã¾ã: å±æ§ã®ã»ãã (:cpp:class:`OGRFieldDefn`), ãã®ã¿ã¤ã, ååãªã©ã¯, :cpp:class:`OGRFeatureDefn` ã¯ã©ã¹ãä»ãã¦è¡¨ç¾ããã¾ã. éå¸¸, 1 ã¤ã® :cpp:class:`OGRFeatureDefn` ã¯å°ç©ã®ã¬ã¤ã¤ã¼ã«å­å¨ãã¾ã. åãå®ç¾©ã¯, ãã®ã¿ã¤ã(ã¾ãã¯å°ç©ã¯ã©ã¹)ã®å°ç©ã«å¯¾ãã¦åç§ã«ã¦ã³ããããæ¹æ³ã§å±æããã¾ã. ç©ºéåº§æ¨ç³»ãã¼ã¿ã¢ãã«ã¯, OpenGIS Well Known Text å½¢å¼ããç¶æ¿ããã¦ãã¾ã. ããã®åç´ãªå½¢å¼ã¯, ã·ã³ãã«ãã£ã¼ãã£ä»æ§ã§å®ç¾©ããã¦ãã¾ã. ããæ´ç·´ãããå½¢å¼ã¯, åº§æ¨å¤æä»æ§ã§è¦ã¤ããã¾ã. :cpp:class:`OGRSpatialReference` ã¯, åº§æ¨å¤æä»æ§ã®æ©è½ã«åºã¥ãã¦æ§ç¯ããã¦ãã¾ãã, ä»¥åã®ã·ã³ãã«ãã£ã¼ãã£å½¢å¼ã¨äºææ§ãããããã«æå³ããã¦ãã¾ã. ç°ãªãåº§æ¨ç³»éã§ã®å¤æã« |PROJ| ãä½¿ç¨ããããã® :cpp:class:`OGRCoordinateTransformation` ã¯ã©ã¹ãé¢é£ä»ãããã¦ãã¾ã. ãã®ãã¼ã¸ã§ã¯,ãã¯ã¿ã¼ãã¼ã¿ã®å¦çã«ä½¿ç¨ãããã¯ã©ã¹ã«ã¤ãã¦èª¬æãã¾ã.å¤ãã®ãã¼ã¿ ã¿ã¤ãã¨ã¡ã½ããåã¯ OGC ã·ã³ãã« ãã£ã¼ãã£ ãã¼ã¿ ã¢ãã«ã«åºã¥ãã¦ãããã, `specifications published by OGC <https://www.ogc.org/standard/sfa/>`__ ãç¢ºèªããã¨å½¹ç«ã¤å ´åãããã¾ã.æ­´å²çãªçç±ãã,GDAL ã§ã¯ãã¯ã¿ã¼ãã¼ã¿ã«ã®ã¿é©ç¨ãããã¿ã¤ãã¨é¢æ°ãç¤ºãããã« "OGR" ãã¬ãã£ãã¯ã¹ãä½¿ç¨ãã¦ãã¾ã. ãã¯ã¿ã¼ãã¼ã¿ã¼ã¢ãã« ä¸é¨ã®ãã©ã¤ããä½¿ç¨ããå ´å, :cpp:class:`GDALDataset` ã¯, ä¸ä½ã®ãã¼ã¿ã¹ãã¢ã¨ããåãããã¨ãã«ãã©ã³ã¶ã¯ã·ã§ã³ãéå§, ã³ããã, ã­ã¼ã«ããã¯ããã¡ã«ããºã ãæä¾ãã¦ãã¾ã. çè«çã«ã¯, æ¢å­ã® :cpp:class:`OGRGeometry` ã¯ã©ã¹ããä»ã®ã¾ãã¯ããå·ä½çãªã¸ãªã¡ããªã¯ã©ã¹ãæ´¾çããããã¨ãå¯è½ã§ãã, ããã¯ååã«èæ®ããã¦ããªãå´é¢ã§ã. ç¹ã«, :cpp:class:`OGRGeometryFactory` ãå¤æ´ããã«, å°ç¨ã®ã¯ã©ã¹ãä½æãããã¨ãå¯è½ã§ã. 