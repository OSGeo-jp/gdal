Þ    P                      ©       Ç     á    e  c   m  P  Ñ    "
  ,  <     i     o  /   þ  o   .  %     Ê  Ä  ³       C  0   O  A     h   Â  U   +       $       ¯  ¢  Î  N   q  "  À  £   ã  ð     È   x     A  8   Z       [        t  ]     I   _  È  ©     r   4     Õ  Æ!     #  ä   <$  S   !%    u%    '  !  §(     É)  Ç   é)  ;   ±*  5   í*     #+  Í   ,+  N  ú+  À  I-     
/  M   %/  s   s/  E   ç/  D   -0  ÿ  r0  G   r2  7   º2  A  ò2  L  44  ®   6     07  3   Q8  ß   8  3   e9  -   9  6   Ç9  ?   þ9  N   >:  M   :  k   Û:  P  G;  À   =  Ð   Y>  Å   *?  q  ð?  ¾   bA    !B  Ï   ¨C  a  xD     ÚE  ¼  \F  t  H  Å  I     TK  Æ   ZK  @   !L  Ã   bL  ?   &M  µ  fM  Y  P     vR  N   }R  c   ÌR     0S  o   ÍS     =T  /   AT  R  qT  w  ÄU  v   <X  v  ³X  ¿   *Z  I  êZ    4\  !   P]  @   r]  Á   ³]  n   u^  ´   ä^     _  i   *`    `  =   ¬f  Ö  êf  ü  Áh  À   ¾k  -  l     ­m  ø  3n  ü  ,p    )r  =   ªs  	  ès  F   òt  Z   9u     u  ý   u  ¡  v  g  ;x     £z  v   ¹z  ä   0{  c   |  ~   y|    ø|  T   |  R   Ñ  Ö  $  ñ  û  Û   í    É  M   Z  þ   ¨  O   §  C   ÷  S   ;  f     {   ö  z   r  z   í  O  h    ¸    Ó  )  ñ   (Error when Completely Outside) Same as :option:`-epo`, except that the criterion for erroring out is when the request falls completely outside the source raster extent. (Error when Partially Outside) If this option is set, :option:`-srcwin` or :option:`-projwin` values that falls partially outside the source raster extent will be considered as an error. The default behavior is to accept such requests, when they were considered as an error before. Add the indicated ground control point to the output dataset.  This option may be provided multiple times to provide a set of GCPs. Apply the scale/offset metadata for the bands to convert scaled values to unscaled values.  It is also often necessary to reset the output datatype with the :option:`-ot` switch. The unscaled value is computed from the scaled raw value with the following formula: Assign a coordinate epoch, linked with the output SRS. Useful when the output SRS is a dynamic CRS. Assign a specified nodata value to output bands. It can be set to ``none`` to avoid setting a nodata value to the output file if one exists for the source file. Note that, if the input dataset has a nodata value, this does not cause pixel values that are equal to that nodata value to be changed to the value specified with this option. Assign/override the georeferenced bounds of the output file.  This assigns georeferenced bounds to the output file, ignoring what would have been derived from the source file. So this does not cause reprojection to the specified SRS. This is mutually exclusive with :option:`-a_gt` Assign/override the geotransform of the output file. This assigns the geotransform to the output file, ignoring what would have been derived from the source file. So this does not cause reprojection to the specified SRS. See :ref:`geotransforms_tut`. This is mutually exclusive with :option:`-a_ullr` C API Can be specified to YES to avoid prior destruction of existing dataset, for drivers that support adding several subdatasets (e.g. GTIFF, NITF) Converts raster data between different formats. Copy all subdatasets of this file to individual output files.  Use with formats like HDF that have subdatasets. Dataset open option (format specific) Defines if metadata domains of the source dataset should be copied to the destination dataset. In the default AUTO mode, only "safe" domains will be copied, which include the default metadata domain (some drivers may include other domains such as IMD, RPC, GEOLOCATION). When setting YES, all domains will be copied (but a few reserved ones like IMAGE_STRUCTURE or DERIVED_SUBDATASETS). Currently only recognized by the GTiff, COG, VRT, PNG and JPEG drivers. Defines which source metadata domain should be copied. This option restricts the list of source metadata domains to be copied (it implies COPY_SRC_MDD=YES if it is not set). This option may be specified as many times as they are source domains. The default metadata domain is the empty string "" ("_DEFAULT_") may also be used when empty string is not practical). Currently only recognized by the GTiff, COG, VRT, PNG and JPEG drivers. Description Do not copy source RAT into destination dataset. Do not copy the GCPs in the source dataset to the output dataset. Do not copy the XMP metadata in the source dataset to the output dataset when driver is able to copy it. Don't be forgiving of mismatches and lost data when translating to the output format. Examples Force (re)computation of statistics. Force the output image bands to have a specific data type supported by the driver, which may be one of the following: ``Byte``, ``Int8``, ``UInt16``, ``Int16``, ``UInt32``, ``Int32``, ``UInt64``, ``Int64``, ``Float32``, ``Float64``, ``CInt16``, ``CInt32``, ``CFloat32`` or ``CFloat64``. Format/driver name to be attempted to open the input file(s). It is generally not necessary to specify it, but it can be used to skip automatic driver detection, when it fails to select the appropriate driver. This option can be repeated several times to specify several candidate drivers. Note that it does not force those drivers to open the dataset. In particular, some drivers have requirements on file extensions. Gives a brief usage message for the generic GDAL commandline options and exit. In GDAL 2.1.0 and 2.1.1, using -projwin with coordinates not aligned with pixels will result in a sub-pixel shift. This has been corrected in later versions. When selecting non-nearest neighbour resampling, starting with GDAL 2.1.0, sub-pixel accuracy is however used to get better results. In addition to the driver-specific creation options, gdal_translate (and :cpp:func:`GDALTranslate` and :cpp:func:`GDALCreateCopy`) recognize the following options: Many formats have one or more optional creation options that can be used to control particulars about the file created. For instance, the GeoTIFF driver supports creation options to control compression, and whether the file should be tiled. Masked values, either identified through a nodata value metadata set on the source band, a mask band, an alpha band will not be used during resampling (when using :option:`-outsize` or :option:`-tr`). No reprojection is done. Nodata / source validity mask handling during resampling Override the color interpretation of all specified bands. For example -colorinterp red,green,blue,alpha for a 4 band output dataset. Override the color interpretation of band X (where X is a valid band number, starting at 1) Override the projection for the output file. Can be used with :option:`-a_ullr` or :option:`-a_gt` to specify the extent in this projection. Passes a metadata key and value in specified domain to set on the output dataset if possible. Passes a metadata key and value to set on the output dataset if possible. Rescale the input pixels values from the range **src_min** to **src_max** to the range **dst_min** to **dst_max**. If omitted the output range is 0 to 255. If omitted the input range is automatically computed from the source dataset, in its whole (not just the window of interest potentially specified with :option:`-srcwin` or :option:`-projwin`). This may be a slow operation on a large source dataset, and if using it multiple times for several gdal_translate invocation, it might be beneficial to call ``gdalinfo -stats {source_dataset}`` priorly to precompute statistics, for formats that support serializing statistics computations (GeoTIFF, VRT...) Note that the values specified after :option:`-scale` are only used to compute a scale and offset to apply to the input raster values. In particular, ``src_min`` and ``src_max`` are not used to clip input values. :option:`-scale` can be repeated several times (if specified only once, it also applies to all bands of the output dataset), so as to specify per band parameters. It is also possible to use the "-scale_bn" syntax where bn is a band number (e.g. "-scale_2" for the 2nd band of the output dataset) to specify the parameters of one or several specific bands. Select a resampling algorithm. Select an input band **band** for output. Bands are numbered from 1. Multiple :option:`-b` switches may be used to select a set of input bands to write to the output file, or to reorder bands. **band** can also be set to "mask,1" (or just "mask") to mean the mask band of the first band of the input dataset. Select an input band **band** to create output dataset mask band. Bands are numbered from 1. **band** can be set to "none" to avoid copying the global mask of the input dataset if it exists. Otherwise it is copied by default ("auto"), unless the mask is an alpha channel, or if it is explicitly used to be a regular band of the output dataset ("-b mask"). **band** can also be set to "mask,1" (or just "mask") to mean the mask band of the 1st band of the input dataset. Select the output format. Starting with GDAL 2.3, if not specified, the format is guessed from the extension (previously was GTiff). Use the short format name. Selects a subwindow from the source image for copying (like :option:`-srcwin`) but with the corners given in georeferenced coordinates (by default expressed in the SRS of the dataset. Can be changed with :option:`-projwin_srs`). Selects a subwindow from the source image for copying based on pixel/line location. Set band offset value. No modification of pixel values is done. Note that the :option:`-unscale` does not take into account :option:`-a_offset`. You may for example specify ``-scale 0 1 <offset> <offset+scale>`` to apply a (offset, scale) tuple, for the equivalent of the 2 steps: ``gdal_translate input.tif tmp.vrt -a_scale scale -a_offset offset`` followed by ``gdal_translate tmp.vrt output.tif -unscale`` Set band scaling value. No modification of pixel values is done. Note that the :option:`-unscale` does not take into account :option:`-a_scale`. You may for example specify ``-scale 0 1 <offset> <offset+scale>`` to apply a (offset, scale) tuple, for the equivalent of the 2 steps: ``gdal_translate input.tif tmp.vrt -a_scale scale -a_offset offset`` followed by ``gdal_translate tmp.vrt output.tif -unscale`` Set the size of the output file.  Outsize is in pixels and lines unless '%' is attached in which case it is as a fraction of the input image size. If one of the 2 values is set to 0, its value will be determined from the other one, while maintaining the aspect ratio of the source dataset. Show this help message and exit Specifies the SRS in which to interpret the coordinates given with :option:`-projwin`. The <srs_def> may be any of the usual GDAL/OGR forms, complete WKT, PROJ.4, EPSG:n or a file containing the WKT. Subsetting using :option:`-projwin` and :option:`-outsize`: Suppress progress monitor and other non-error output. Synopsis The :program:`gdal_translate` utility can be used to convert raster data between different formats, potentially performing some operations like subsettings, resampling, and rescaling pixels in the process. The coordinate reference systems that can be passed are anything supported by the :cpp:func:`OGRSpatialReference::SetFromUserInput` call, which includes EPSG Projected, Geographic or Compound CRS (i.e. EPSG:4296), a well known text (WKT) CRS definition, PROJ.4 declarations, or the name of a .prj file containing a WKT CRS definition. The creation options available vary by format driver, and some simple formats have no creation options at all. A list of options supported for a format can be listed with the :ref:`--formats <raster_common_options_formats>` command line option but the documentation for the format is the definitive source of information on driver creation options. See :ref:`raster_drivers` format specific documentation for legal creation options for each format. The destination file name. The details of how it is taken into account depends on the resampling kernel: The source dataset name. It can be either file name, URL of data source or subdataset name for multi-dataset files. This does not cause reprojection of the dataset to the specified SRS. This utility is also callable from C with :cpp:func:`GDALTranslate`. To apply non-linear scaling with a power function. exp_val is the exponent of the power function (must be positive). This option must be used with the -scale option. If specified only once, -exponent applies to all bands of the output image. It can be repeated several times so as to specify per band parameters. It is also possible to use the "-exponent_bn" syntax where bn is a band number (e.g. "-exponent_2" for the 2nd band of the output dataset) to specify the parameters of one or several specific bands. To create a JPEG-compressed TIFF with internal mask from a RGBA dataset To create a RGBA dataset from a RGB dataset with a mask To expose a dataset with 1 band with a color table as a dataset with 3 (RGB) or 4 (RGBA) bands. Useful for output drivers such as JPEG, JPEG2000, MrSID, ECW that don't support color indexed datasets. The 'gray' value enables to expand a dataset with a color table that only contains gray levels to a gray indexed dataset. To specify which overview level of source file must be used. The default choice, AUTO, will select the overview level whose resolution is the closest to the target resolution. Specify an integer value (0-based, i.e. 0=1st overview level) to select a particular level. Specify AUTO-n where n is an integer greater or equal to 1, to select an overview level below the AUTO one. Or specify NONE to force the base resolution to be used (can be useful if overviews have been generated with a low quality resampling method, and a higher quality resampling method is specified with :option:`-r`. When :option:`-ovr` is specified to an integer value, and none of :option:`-outsize` and :option:`-tr` is specified, the size of the overview will be used as the output size. When :option:`-ovr` is specified, values of :option:`-srcwin`, when specified, should be expressed as pixel offset and size of the full resolution source dataset. Similarly when using :option:`-outsize` with percentage values, they refer to the size of the full resolution source dataset. When setting NO, no source metadata will be copied. ``average`` computes the average of all non-NODATA contributing pixels. Starting with GDAL 3.1, this is a weighted average taking into account properly the weight of source pixels not contributing fully to the target pixel. ``bilinear`` applies a bilinear convolution kernel. ``cubic`` applies a cubic convolution kernel. ``cubicspline`` applies a B-Spline convolution kernel. ``lanczos`` applies a Lanczos windowed sinc convolution kernel. ``mode`` selects the value which appears most often of all the sampled points. ``nearest`` (default) applies a nearest neighbour (simple sampling) resampler ``rms`` computes the root mean squared / quadratic mean of all non-NODATA contributing pixels (GDAL >= 3.3) for bilinear, cubic, cubicspline and lanczos, for each target pixel, the weights of contributing source pixels is set to zero to ignore them when they are masked. There is an extra specificity for cubic: given that some of the weights in the kernel are negative, such strategy could lead to strong overshoot/undershoot when there is an alternance of valid and invalid pixels. Consequently, if any of the horizontal or vertical direction, if the maximum number of valid source pixels in each dimension is less than the radius of the resampling kernel, the target pixel is considered as nodata. for nearest resampling, for each target pixel, one of the potential contributing source pixels is selected (in an implementation specific way). Its value is used as it, be it valid or invalid. for the other resampling methods, source pixels contributing to the target pixel are ignored if masked. Only the valid ones are taken into account. If there are none, the target pixel is considered as nodata. set target resolution. The values must be expressed in georeferenced units. Both must be positive values. This is mutually exclusive with :option:`-outsize`, :option:`-a_ullr`, and :option:`-a_gt`. Project-Id-Version: GDAL 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2024-07-01 04:49+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ja
Language-Team: ja <LL@li.org>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.15.0
 ï¼å®å¨ã«å¤ãã¦ããå ´åã®ã¨ã©ã¼ï¼ :option:`-epo` ã¨åãã§ãããã¨ã©ã¼ã«ãªãåºæºã¯ãè¦æ±ãã½ã¼ã¹ã©ã¹ã¿ã¼ç¯å²ã®å®å¨ã«å¤ã«ããå ´åã§ãã ï¼é¨åçã«å¤ãã¦ããå ´åã®ã¨ã©ã¼ï¼ãã®ãªãã·ã§ã³ãè¨­å®ããã¦ããå ´åã :option:`-srcwin` ã¾ãã¯ :option:`-projwin` ã®å¤ãã½ã¼ã¹ã©ã¹ã¿ã¼ç¯å²ã®ä¸é¨å¤ã«ããå ´åã¯ã¨ã©ã¼ã¨è¦ãªããã¾ããããã©ã«ãã®åä½ã¯ããã®ãããªè¦æ±ãåãå¥ãããã¨ã§ãããä»¥åã¯ã¨ã©ã¼ã¨è¦ãªããã¦ãã¾ããã æå®ãããã°ã©ã³ãã³ã³ãã­ã¼ã«ãã¤ã³ããåºåãã¼ã¿ã»ããã«è¿½å ãã¾ãããã®ãªãã·ã§ã³ã¯ãè¤æ°åæä¾ããããã¨ããããä¸é£ã®GCPãæä¾ãã¾ãã ãã³ãã®ã¹ã±ã¼ã«/ãªãã»ãã ã¡ã¿ãã¼ã¿ãé©ç¨ãã¦ãã¹ã±ã¼ãªã³ã°ãããå¤ãéã¹ã±ã¼ãªã³ã°å¤ã«å¤æãã¾ããåºåãã¼ã¿åã :option:`-ot` ã¹ã¤ããã§ãªã»ãããããã¨ãããå¿è¦ã§ããéã¹ã±ã¼ãªã³ã°å¤ã¯ãæ¬¡ã®å¼ã§ã¹ã±ã¼ãªã³ã°ãããçå¤ããè¨ç®ããã¾ãã åºåSRSã«ãªã³ã¯ãããåº§æ¨ã¨ããã¯ãå²ãå½ã¦ã¾ããåºåSRSãåçCRSã§ããå ´åã«å½¹ç«ã¡ã¾ãã æå®ãããnodataå¤ãåºåãã³ãã«å²ãå½ã¦ã¾ããã½ã¼ã¹ãã¡ã¤ã«ã«å­å¨ããå ´åãåºåãã¡ã¤ã«ã«nodataå¤ãè¨­å®ããªãããã«ããã«ã¯ã``none`` ã«è¨­å®ã§ãã¾ããå¥åãã¼ã¿ã»ããã«nodataå¤ãããå ´åãããã«ããããã®nodataå¤ã«ç­ãããã¯ã»ã«å¤ããã®ãªãã·ã§ã³ã§æå®ãããå¤ã«å¤æ´ããããã¨ã¯ãªããã¨ã«æ³¨æãã¦ãã ããã åºåãã¡ã¤ã«ã®å°çåç§å¢çãå²ãå½ã¦/ãªã¼ãã¼ã©ã¤ããã¾ããããã«ãããã½ã¼ã¹ãã¡ã¤ã«ããæ´¾çããã¯ãã®ãã®ãç¡è¦ãã¦ãåºåãã¡ã¤ã«ã«å°çåç§å¢çãå²ãå½ã¦ããã¾ãããããã£ã¦ãæå®ãããSRSã¸ã®åæå½±ã¯çºçãã¾ãããããã¯ :option:`-a_gt` ã¨ç¸äºæä»ã§ãã åºåãã¡ã¤ã«ã®ã¸ãªãã©ã³ã¹ãã©ã¼ã ãå²ãå½ã¦/ãªã¼ãã¼ã©ã¤ããã¾ããããã«ãããã½ã¼ã¹ãã¡ã¤ã«ããæ´¾çããã¯ãã®ãã®ãç¡è¦ãã¦ãåºåãã¡ã¤ã«ã«ã¸ãªãã©ã³ã¹ãã©ã¼ã ãå²ãå½ã¦ããã¾ãããããã£ã¦ãæå®ãããSRSã¸ã®åæå½±ã¯çºçãã¾ããã:ref:`geotransforms_tut` ãåç§ãã¦ãã ãããããã¯ :option:`-a_ullr` ã¨ç¸äºæä»ã§ãã C API è¤æ°ã®ãµããã¼ã¿ã»ããã®è¿½å ããµãã¼ããããã©ã¤ã(ä¾:GTIFFãNITF)ã«ã¤ãã¦ãæ¢å­ã®ãã¼ã¿ã»ããã®äºåç ´å£ãåé¿ããããã«YESã«æå®ã§ãã¾ã ã©ã¹ã¿ã¼ ãã¼ã¿ã¼ãç°ãªãå½¢å¼éã§å¤æãã¾ã ãã®ãã¡ã¤ã«ã®ãã¹ã¦ã®ãµããã¼ã¿ã»ãããåå¥ã®åºåãã¡ã¤ã«ã«ã³ãã¼ãã¾ãããµããã¼ã¿ã»ãããæã¤HDFã®ãããªå½¢å¼ã¨ä¸ç·ã«ä½¿ç¨ãã¾ãã ãã¼ã¿ã»ãããªã¼ãã³ãªãã·ã§ã³ï¼å½¢å¼åºæï¼ ã½ã¼ã¹ãã¼ã¿ã»ããã®ã¡ã¿ãã¼ã¿ãã¡ã¤ã³ãå®åãã¼ã¿ã»ããã«ã³ãã¼ãããã©ãããå®ç¾©ãã¾ããããã©ã«ãã®AUTOã¢ã¼ãã§ã¯ã"safe" ãã¡ã¤ã³ã®ã¿ãã³ãã¼ããã¾ããããã«ã¯ãããã©ã«ãã®ã¡ã¿ãã¼ã¿ãã¡ã¤ã³ãå«ã¾ãã¾ã(ä¸é¨ã®ãã©ã¤ãã«ã¯IMDãRPCãGEOLOCATIONãªã©ã®ä»ã®ãã¡ã¤ã³ãå«ã¾ããå ´åãããã¾ã)ãYESã«è¨­å®ããã¨ããã¹ã¦ã®ãã¡ã¤ã³ãã³ãã¼ããã¾ã(ãã ããIMAGE_STRUCTUREãDERIVED_SUBDATASETSãªã©ã®ããã¤ãã®äºç´ããããã®ãé¤ã)ãç¾å¨ãGTiffãCOGãVRTãPNGãããã³JPEGãã©ã¤ãã§ã®ã¿èªè­ããã¾ãã ã©ã®ã½ã¼ã¹ã¡ã¿ãã¼ã¿ãã¡ã¤ã³ãã³ãã¼ããããå®ç¾©ãã¾ãããã®ãªãã·ã§ã³ã¯ãã³ãã¼ãããã½ã¼ã¹ã¡ã¿ãã¼ã¿ãã¡ã¤ã³ã®ãªã¹ããå¶éãã¾ã(è¨­å®ããã¦ããªãå ´åãCOPY_SRC_MDD=YESãæå³ãã¾ã)ããã®ãªãã·ã§ã³ã¯ãã½ã¼ã¹ãã¡ã¤ã³ã®æ°ã ãæå®ã§ãã¾ããããã©ã«ãã®ã¡ã¿ãã¼ã¿ãã¡ã¤ã³ã¯ç©ºã®æå­å  "" ("_DEFAULT_") ã§ãããç©ºã®æå­åãå®ç¨çã§ãªãå ´åã«ãä½¿ç¨ã§ãã¾ããç¾å¨ãGTiffãCOGãVRTãPNGãããã³JPEGãã©ã¤ãã§ã®ã¿èªè­ããã¾ãã èª¬æ ã½ã¼ã¹RATãå®åãã¼ã¿ã»ããã«ã³ãã¼ããªãã§ãã ããã ã½ã¼ã¹ãã¼ã¿ã»ããã®GCPãåºåãã¼ã¿ã»ããã«ã³ãã¼ããªãã§ãã ããã ãã©ã¤ããã³ãã¼ã§ããå ´åãã½ã¼ã¹ãã¼ã¿ã»ããã®XMPã¡ã¿ãã¼ã¿ãåºåãã¼ã¿ã»ããã«ã³ãã¼ããªãã§ãã ããã åºåå½¢å¼ã«å¤æããéã«ãä¸ä¸è´ããã¼ã¿ã®æå¤±ãããå ´åã«ã¯è¨±å¯ããã¾ããã ä¾ çµ±è¨ã®(å)è¨ç®ãå¼·å¶å®è¡ãã¾ãã åºåç»åãã³ãããã©ã¤ãã¼ã§ãµãã¼ãããã¦ããç¹å®ã®ãã¼ã¿åã«å¼·å¶ãã¾ããæ¬¡ã®ããããã«ãªãå ´åãããã¾ã: ``Byte``, ``Int8``, ``UInt16``, ``Int16``, ``UInt32``, ``Int32``, ``UInt64``, ``Int64``, ``Float32``, ``Float64``, ``CInt16``, ``CInt32``, ``CFloat32`` ã¾ãã¯ ``CFloat64``ã å¥åãã¡ã¤ã«ãéãããã«è©¦ã¿ããã©ã¼ããã/ãã©ã¤ãã¼åãéå¸¸ã¯æå®ããå¿è¦ã¯ããã¾ããããé©åãªãã©ã¤ãã¼ãé¸æã§ããªãå ´åã«ãèªåãã©ã¤ãã¼æ¤åºãã¹ã­ããããããã«ä½¿ç¨ã§ãã¾ãããã®ãªãã·ã§ã³ã¯è¤æ°åç¹°ãè¿ãã¦ãããã¤ãã®åè£ãã©ã¤ãã¼ãæå®ãããã¨ãã§ãã¾ãããããã®ãã©ã¤ãã¼ããã¼ã¿ã»ãããéããã¨ãå¼·å¶ãããã®ã§ã¯ãªããã¨ã«æ³¨æãã¦ãã ãããç¹ã«ãããã¤ãã®ãã©ã¤ãã¼ã«ã¯ãã¡ã¤ã«æ¡å¼µå­ã«é¢ããè¦ä»¶ãããã¾ãã ä¸è¬çãªGDALã³ãã³ãã©ã¤ã³ãªãã·ã§ã³ã®ç°¡åãªä½¿ç¨ã¡ãã»ã¼ã¸ãè¡¨ç¤ºãã¦çµäºãã¾ãã GDAL 2.1.0ããã³2.1.1ã§ã¯ããã¯ã»ã«ã¨ä¸è´ããªãåº§æ¨ã§ -projwin ãä½¿ç¨ããã¨ããµããã¯ã»ã«ã·ãããçºçãã¾ããããã¯å¾ã®ãã¼ã¸ã§ã³ã§ä¿®æ­£ããã¦ãã¾ããæè¿åä»¥å¤ã®åãµã³ããªã³ã°ãé¸æããå ´åãGDAL 2.1.0ä»¥éããµããã¯ã»ã«ç²¾åº¦ãä½¿ç¨ãããããè¯ãçµæãå¾ããã¾ãã ãã©ã¤ãåºæã®ä½æãªãã·ã§ã³ã«å ãã¦ãgdal_translate(ããã³ :cpp:func:`GDALTranslate` ããã³ :cpp:func:`GDALCreateCopy` )ã¯æ¬¡ã®ãªãã·ã§ã³ãèªè­ãã¾ãï¼ å¤ãã®å½¢å¼ã«ã¯ãä½æããããã¡ã¤ã«ã®è©³ç´°ãå¶å¾¡ããããã«ä½¿ç¨ã§ãã1ã¤ä»¥ä¸ã®ãªãã·ã§ã³ä½æãªãã·ã§ã³ãããã¾ãããã¨ãã°ãGeoTIFFãã©ã¤ãã¯å§ç¸®ãå¶å¾¡ããä½æãªãã·ã§ã³ãããã³ãã¡ã¤ã«ãã¿ã¤ã«åãããã©ããããµãã¼ããã¾ãã ã½ã¼ã¹ãã³ãããã¹ã¯ãã³ããã¢ã«ãã¡ãã³ãã«è¨­å®ãããnodataå¤ã¡ã¿ãã¼ã¿ãéãã¦è­å¥ããããã¹ã¯ãããå¤ã¯ãåãµã³ããªã³ã°ä¸­ã«ã¯ä½¿ç¨ããã¾ããï¼:option:`-outsize` ã¾ãã¯ :option:`-tr` ãä½¿ç¨ããå ´åï¼ã åæå½±ã¯è¡ããã¾ããã åãµã³ããªã³ã°ä¸­ã®Nodata/ã½ã¼ã¹æå¹ãã¹ã¯å¦ç ãã¹ã¦ã®æå®ããããã³ãã®ã«ã©ã¼è§£éããªã¼ãã¼ã©ã¤ããã¾ãããã¨ãã°ã4ãã³ãåºåãã¼ã¿ã»ããã®å ´åã¯-colorinterp red,green,blue,alphaã§ãã ãã³ãX(Xã¯1ããå§ã¾ãæå¹ãªãã³ãçªå·)ã®ã«ã©ã¼è§£éããªã¼ãã¼ã©ã¤ããã¾ãã åºåãã¡ã¤ã«ã®æå½±ããªã¼ãã¼ã©ã¤ããã¾ãã :option:`-a_ullr` ã¾ãã¯ :option:`-a_gt` ã¨ä¸ç·ã«ä½¿ç¨ãã¦ããã®æå½±ã®ç¯å²ãæå®ã§ãã¾ãã å¯è½ã§ããã°ãæå®ããããã¡ã¤ã³ã®ã¡ã¿ãã¼ã¿ã­ã¼ã¨å¤ãåºåãã¼ã¿ã»ããã«è¨­å®ããããã«æ¸¡ãã¾ãã å¯è½ã§ããã°ãåºåãã¼ã¿ã»ããã«è¨­å®ããã¡ã¿ãã¼ã¿ã­ã¼ã¨å¤ãæ¸¡ãã¾ãã å¥åãã¯ã»ã«å¤ããç¯å²  **src_min**  ãã **src_max** ãããç¯å² **dst_min**  ãã **dst_max** ã«ãªã¹ã±ã¼ã«ãã¾ããçç¥ãããå ´åãåºåç¯å²ã¯0ãã255ã§ããçç¥ãããå ´åãå¥åç¯å²ã¯ã½ã¼ã¹ãã¼ã¿ã»ããå¨ä½ããèªåçã«è¨ç®ããã¾ã( :option:`-srcwin` ã¾ãã¯ :option:`-projwin` ã§æå®ãããå¯è½æ§ã®ããã¦ã£ã³ãã¦ã ãã§ã¯ããã¾ããï¼ãããã¯å¤§è¦æ¨¡ãªã½ã¼ã¹ãã¼ã¿ã»ããã§ã¯éãæä½ã«ãªãå¯è½æ§ããããè¤æ°åä½¿ç¨ããå ´åãè¤æ°ã® gdal_translate å¼ã³åºãã«å¯¾ãã¦ãäºåã« ``gdalinfo -stats {source_dataset}`` ãå¼ã³åºãã¦çµ±è¨ãäºåè¨ç®ãããã¨ãæçãªå ´åãããã¾ã(çµ±è¨è¨ç®ã®ã·ãªã¢ã«åããµãã¼ãããå½¢å¼ã§ã¯(GeoTIFFãVRT...ï¼ï¼ã :option:`-scale` ã®å¾ã«æå®ãããå¤ã¯ãå¥åã©ã¹ã¿ã¼å¤ã«é©ç¨ããã¹ã±ã¼ã«ã¨ãªãã»ãããè¨ç®ããããã ãã«ä½¿ç¨ããããã¨ã«æ³¨æãã¦ãã ãããç¹ã«ã``src_min`` ããã³ ``src_max`` ã¯å¥åå¤ãã¯ãªããããããã«ä½¿ç¨ããã¾ããã  :option:`-scale` ã¯è¤æ°åç¹°ãè¿ããã¨ãã§ã(1åã ãæå®ãããå ´åãåºåãã¼ã¿ã»ããã®ãã¹ã¦ã®ãã³ãã«é©ç¨ããã¾ã)ããã³ããã¨ã®ãã©ã¡ã¼ã¿ãæå®ãã¾ãã "-scale_bn" æ§æãä½¿ç¨ãã¦ãç¹å®ã®ãã³ãã®ãã©ã¡ã¼ã¿ãæå®ãããã¨ãå¯è½ã§ã(ä¾:åºåãã¼ã¿ã»ããã®2çªç®ã®ãã³ãã®å ´åã"-scale_2" ï¼ã åãµã³ããªã³ã° ã¢ã«ã´ãªãºã ãé¸æãã¾ãã åºåç¨ã®å¥åãã³ã **band** ãé¸æãã¾ãããã³ãã®çªå·ã¯1ããå§ã¾ãã¾ããè¤æ°ã® :option:`-b` ã¹ã¤ãããä½¿ç¨ãã¦ãåºåãã¡ã¤ã«ã«æ¸ãè¾¼ãå¥åãã³ãã®ã»ãããé¸æãããããã³ããä¸¦ã¹æ¿ãããã¨ãã§ãã¾ãã **band** ã¯ãå¥åãã¼ã¿ã»ããã®æåã®ãã³ãã®ãã¹ã¯ãã³ããæå³ããããã«"mask,1"ï¼ã¾ãã¯åã« "mask"ï¼ã«è¨­å®ãããã¨ãã§ãã¾ãã åºåãã¼ã¿ã»ããã®ãã¹ã¯ãã³ããä½æããããã«ãå¥åãã³ã **band** ãé¸æãã¾ãããã³ãã®çªå·ã¯1ããå§ã¾ãã¾ãã **band** ã¯ãå¥åãã¼ã¿ã»ããã®ã°ã­ã¼ãã«ãã¹ã¯ãå­å¨ããå ´åããã®ã³ãã¼ãé¿ããããã« "none" ã«è¨­å®ã§ãã¾ããããã§ãªãå ´åãããã©ã«ã ("auto") ã§ã³ãã¼ããã¾ãããã¹ã¯ãã¢ã«ãã¡ãã£ãã«ã§ãªãéããã¾ãã¯æããã«åºåãã¼ã¿ã»ããã®éå¸¸ã®ãã³ãã¨ãã¦ä½¿ç¨ãããå ´åã¯ ("-b mask") ã«ãªãã¾ãã **band** ã¯ãå¥åãã¼ã¿ã»ããã®1çªç®ã®ãã³ãã®ãã¹ã¯ãã³ããæå³ããããã« "mask,1" (ã¾ãã¯åã« "mask") ã«è¨­å®ãããã¨ãã§ãã¾ãã åºåå½¢å¼ãé¸æãã¾ããGDAL 2.3ä»¥éãæå®ããã¦ããªãå ´åãå½¢å¼ã¯æ¡å¼µå­ããæ¨æ¸¬ããã¾ã(ä»¥åã¯GTiffã§ãã)ãç­ç¸®å½¢å¼åãä½¿ã£ã¦ä¸ããã ã½ã¼ã¹ç»åããã³ãã¼ãããµãã¦ã£ã³ãã¦ãé¸æãã¾ãï¼ :option:`-srcwin` ã®ããã«ï¼ããã ããã³ã¼ãã¼ã¯å°çåç§åº§æ¨ã§æå®ããã¾ã(ããã©ã«ãã§ã¯ãã¼ã¿ã»ããã®SRSã§è¡¨ç¾ããã¾ãã:option:`-projwin_srs` ã§å¤æ´ã§ãã¾ãï¼ã ãã¯ã»ã«/ã©ã¤ã³ã®ä½ç½®ã«åºã¥ãã¦ãã½ã¼ã¹ç»åããã³ãã¼ãããµãã¦ã£ã³ãã¦ãé¸æãã¦ä¸ããã ãã³ããªãã»ããå¤ãè¨­å®ãã¾ãããã¯ã»ã«å¤ã®å¤æ´ã¯è¡ããã¾ããã:option:`-unscale` ã¯ :option:`-a_offset` ãèæ®ããªããã¨ã«æ³¨æãã¦ãã ãããä¾ãã°ã``-scale 0 1 <offset> <offset+scale>`` ãæå®ãã¦(ãªãã»ãããã¹ã±ã¼ã«)ã®ã¿ãã«ãé©ç¨ããæ¬¡ã®2ã¹ãããã«ç¸å½ãã¾ã: ``gdal_translate input.tif tmp.vrt -a_scale scale -a_offset offset`` ã®å¾ã« ``gdal_translate tmp.vrt output.tif -unscale`` ãå®è¡ãã¾ãã ãã³ãã¹ã±ã¼ãªã³ã°å¤ãè¨­å®ãã¾ãããã¯ã»ã«å¤ã®å¤æ´ã¯è¡ããã¾ããã  :option:`-unscale` ã¯ :option:`-a_scale` ãèæ®ããªããã¨ã«æ³¨æãã¦ãã ãããä¾ãã°ã``-scale 0 1 <offset> <offset+scale>`` ãæå®ãã¦(ãªãã»ãããã¹ã±ã¼ã«)ã®ã¿ãã«ãé©ç¨ããæ¬¡ã®2ã¹ãããã«ç¸å½ãã¾ã: ``gdal_translate input.tif tmp.vrt -a_scale scale -a_offset offset`` ã®å¾ã« ``gdal_translate tmp.vrt output.tif -unscale`` ãå®è¡ãã¾ãã åºåãã¡ã¤ã«ã®ãµã¤ãºãè¨­å®ãã¾ããã¢ã¦ããµã¤ãºã¯ãã¯ã»ã«ã¨ã©ã¤ã³ã§æå®ããã¾ããã'%'ãä»ãã¦ããå ´åã¯å¥åç»åãµã¤ãºã®å²åã«ãªãã¾ãã2ã¤ã®å¤ã®ãã¡1ã¤ã0ã«è¨­å®ããã¦ããå ´åããã®å¤ã¯ããä»æ¹ã®å¤ããæ±ºå®ãããã½ã¼ã¹ãã¼ã¿ã»ããã®ã¢ã¹ãã¯ãæ¯ãç¶­æããã¾ãã ãã®ãã«ã ã¡ãã»ã¼ã¸ãè¡¨ç¤ºãã¦çµäºãã¾ã  :option:`-projwin` ã§æå®ãããåº§æ¨ãè§£éããããã®SRSãæå®ãã¾ãã <srs_def> ã¯ãéå¸¸ã®GDAL/OGRå½¢å¼ã®ãããããå®å¨ãªWKTãPROJ.4ãEPSGãã¾ãã¯WKTãå«ããã¡ã¤ã«ã®ããããã§ããå¯è½æ§ãããã¾ãã :option:`-projwin` and :option:`-outsize` ãå©ç¨ãããµãè¨­å®: é²è¡ç¶æ³ã¢ãã¿ã¼ããã³ãã®ä»ã®ã¨ã©ã¼ã§ãªãåºåãæå¶ãã¾ãã æ¦è¦ ã¦ã¼ãã£ãªãã£ãä½¿ç¨ãã¦ãã©ã¹ã¿ã¼ ãã¼ã¿ãç°ãªãå½¢å¼éã§å¤æã§ãã¾ãããã®éç¨ã§ãµãã»ããåãåãµã³ããªã³ã°ãããã³ãã¯ã»ã«ã®ãªã¹ã±ã¼ã«ãªã©ã®æä½ãè¡ããã¨ãã§ãã¾ãã æ¸¡ããã¨ãã§ããåº§æ¨åç§ç³»ã¯ã  :cpp:func:`OGRSpatialReference::SetFromUserInput`  å¼ã³åºãã«ãã£ã¦ãµãã¼ãããããã®ã§ããã°ä½ã§ããã¾ãã¾ãããããã«ã¯ãEPSG ProjectedãGeographicã¾ãã¯Compound CRS(ä¾:EPSG:4296)ãããç¥ããã¦ãããã­ã¹ã(WKT)CRSå®ç¾©ãPROJ.4å®£è¨ãã¾ãã¯WKT CRSå®ç¾©ãå«ã.prjãã¡ã¤ã«ã®ååãå«ã¾ãã¾ãã å©ç¨å¯è½ãªä½æãªãã·ã§ã³ã¯ãå½¢å¼ãã©ã¤ãã«ãã£ã¦ç°ãªããä¸é¨ã®åç´ãªå½¢å¼ã«ã¯ä½æãªãã·ã§ã³ãã¾ã£ããããã¾ãããå½¢å¼ãã¨ã«ãµãã¼ãããããªãã·ã§ã³ã®ãªã¹ãã¯ã:ref:`--formats  <raster_common_options_formats>` ã³ãã³ãã©ã¤ã³ãªãã·ã§ã³ã§ãªã¹ãã§ãã¾ãããå½¢å¼ã®ãã­ã¥ã¡ã³ãã¯ãã©ã¤ãä½æãªãã·ã§ã³ã«é¢ããæå ±ã®æçµçãªã½ã¼ã¹ã§ããå½¢å¼ãã¨ã®æ³çãªä½æãªãã·ã§ã³ã«ã¤ãã¦ã¯ã:ref:`raster_drivers` å½¢å¼åºæã®ãã­ã¥ã¡ã³ããåç§ãã¦ãã ããã å®åãã¡ã¤ã«å ãããã©ã®ããã«èæ®ããããã®è©³ç´°ã¯ãåãµã³ããªã³ã°ã«ã¼ãã«ã«ãã£ã¦ç°ãªãã¾ã: ã½ã¼ã¹ãã¼ã¿ã»ããã®ååã§ããããã¯ãã¡ã¤ã«åããã¼ã¿ã½ã¼ã¹ã®URLãã¾ãã¯ãã«ããã¼ã¿ã»ãããã¡ã¤ã«ã®ãµããã¼ã¿ã»ããåã®ããããã§ããå¯è½æ§ãããã¾ãã ãã®å¦çã§ãã¼ã¿ã»ããã«æå®ãããSRSã«åæå½±ãããã¨ã¯ããã¾ããã ãã®ã¦ã¼ãã£ãªãã£ã¯ã:cpp:func:`GDALTranslate` ãä½¿ç¨ãã¦Cè¨èªãããå¼ã³åºããã¨ãã§ãã¾ãã ã¹ãé¢æ°ã«ããéç·å½¢ã¹ã±ã¼ãªã³ã°ãé©ç¨ãã¾ããexp_valã¯ã¹ãé¢æ°ã®ææ°ã§ã(æ­£ã§ãªããã°ãªãã¾ãã)ããã®ãªãã·ã§ã³ã¯ã -scale ãªãã·ã§ã³ã¨ä¸ç·ã«ä½¿ç¨ããå¿è¦ãããã¾ãã1åã ãæå®ãããå ´åã-exponent ã¯åºåç»åã®ãã¹ã¦ã®ãã³ãã«é©ç¨ããã¾ããè¤æ°åç¹°ãè¿ãã¦ããã³ããã¨ã®ãã©ã¡ã¼ã¿ãæå®ãããã¨ãã§ãã¾ãã "-exponent_bn" æ§æãä½¿ç¨ãã¦ãç¹å®ã®ãã³ãã®ãã©ã¡ã¼ã¿ãæå®ãããã¨ãå¯è½ã§ã(ä¾:åºåãã¼ã¿ã»ããã®2çªç®ã®ãã³ãã®å ´åã"-exponent_2" ï¼ã RGBAãã¼ã¿ã»ããããåé¨ãã¹ã¯ãå«ãJPEGå§ç¸®TIFFãä½æãã¾ã ãã¹ã¯ä»ãRGBãã¼ã¿ã»ããããRGBAãã¼ã¿ã»ãããä½æãã¾ã 1ã¤ã®ãã³ãã«ã«ã©ã¼ãã¼ãã«ããããã¼ã¿ã»ãããã3(RGB)ã¾ãã¯4(RGBA)ã®ãã³ããæã¤ãã¼ã¿ã»ããã¨ãã¦å¬éãã¾ããã«ã©ã¼ãã¼ãã«ããµãã¼ãããªãJPEGãJPEG2000ãMrSIDãECWãªã©ã®åºåãã©ã¤ãã¼ã«å½¹ç«ã¡ã¾ãã'gray' å¤ãä½¿ç¨ããã¨ãç°è²ã¬ãã«ã®ã¿ãå«ãã«ã©ã¼ãã¼ãã«ãæã¤ãã¼ã¿ã»ãããç°è²ã¤ã³ããã¯ã¹ä»ããã¼ã¿ã»ããã«æ¡å¼µã§ãã¾ãã ã½ã¼ã¹ãã¡ã¤ã«ã®ã©ã®æ¦è¦è¡¨ç¤ºã¬ãã«ãä½¿ç¨ããããæå®ãã¾ããããã©ã«ãã®é¸æã¯AUTOã§ãã¿ã¼ã²ããè§£ååº¦ã«æãè¿ãè§£ååº¦ã®æ¦è¦è¡¨ç¤ºã¬ãã«ãé¸æããã¾ããç¹å®ã®ã¬ãã«ãé¸æããã«ã¯æ´æ°å¤(0ãã¼ã¹ãããªãã¡0=1çªç®ã®æ¦è¦è¡¨ç¤ºã¬ãã«)ãæå®ãã¾ãã AUTO-n ãæå®ããã¨ãn ã¯1ä»¥ä¸ã®æ´æ°ã§ãããAUTOã®1ã¤ä¸ã®æ¦è¦è¡¨ç¤ºã¬ãã«ãé¸æãã¾ããã¾ãã¯ãNONEãæå®ãã¦ãã¼ã¹è§£ååº¦ãå¼·å¶çã«ä½¿ç¨ããã¾ã(ä½åè³ªã®åãµã³ããªã³ã°æ¹æ³ã§æ¦è¦è¡¨ç¤ºãçæãããå ´åã«å½¹ç«ã¡ã¾ãããã®å ´åãããé«åè³ªã®åãµã³ããªã³ã°æ¹æ³ã :option:`-r` ã§æå®ãã¾ãã  :option:`-ovr` ãæ´æ°å¤ã«æå®ããã¦ããã :option:`-outsize` ããã³ :option:`-tr` ã®ããããæå®ããã¦ããªãå ´åãæ¦è¦è¡¨ç¤ºã®ãµã¤ãºãåºåãµã¤ãºã¨ãã¦ä½¿ç¨ããã¾ãã  :option:`-ovr` ãæå®ããã¦ããå ´åã«ã :option:`-srcwin` ã®å¤ãæå®ãããå ´åããã«è§£ååº¦ã½ã¼ã¹ãã¼ã¿ã»ããã®ãã¯ã»ã«ãªãã»ããããã³ãµã¤ãºã¨ãã¦è¡¨ç¾ãããå¿è¦ãããã¾ããåæ§ã«ããã¼ã»ã³ãã¼ã¸å¤ãä½¿ç¨ããå ´åã :option:`-outsize` ã¯ããã«è§£ååº¦ã½ã¼ã¹ãã¼ã¿ã»ããã®ãµã¤ãºãæãã¾ãã NOã«è¨­å®ããã¨ãã½ã¼ã¹ã¡ã¿ãã¼ã¿ã¯ã³ãã¼ããã¾ããã ``average`` ã¯ããã¹ã¦ã®éNODATAã§æ§æããããã¯ã»ã«ã®å¹³åãè¨ç®ãã¾ããGDAL 3.1ä»¥éãããã¯ãã¿ã¼ã²ãããã¯ã»ã«ã¨ãã¦é©ç¨ããªãã½ã¼ã¹ãã¯ã»ã«ã®éã¿ãé©åã«èæ®ããå éå¹³åã§ãã `bilinear``  ã¯ããã¤ãªãã¢ç³ã¿è¾¼ã¿ã«ã¼ãã«ãé©ç¨ãã¾ãã ``cubic`` ã¯ãä¸æ¬¡ç³ã¿è¾¼ã¿ã«ã¼ãã«ãé©ç¨ãã¾ãã ``cubicspline`` ã¯ãBã¹ãã©ã¤ã³ç³ã¿è¾¼ã¿ã«ã¼ãã«ãé©ç¨ãã¾ãã ``lanczos`` ã¯ãã©ã³ãã©ã¹ã¦ã£ã³ãã¦ã·ã³ã¯ç³ã¿è¾¼ã¿ã«ã¼ãã«ãé©ç¨ãã¾ãã ``mode`` ã¯ããµã³ããªã³ã°ããããã¹ã¦ã®ãã¤ã³ãã®ä¸­ã§æãé »ç¹ã«ç¾ããå¤ãé¸æãã¾ãã  ``nearest`` (ããã©ã«ãï¼ããæè¿åï¼åç´ãµã³ããªã³ã°ï¼ãªãµã³ãã©ã¼ã¨ãã¦é©ç¨ããã¾ã ``rms``  ã¯ããã¹ã¦ã®éNODATAé©ç¨ãã¯ã»ã«ã®äºä¹å¹³åå¹³æ¹æ ¹/äºä¹å¹³åãè¨ç®ãã¾ã(GDAL >= 3.3) ãã¤ãªãã¢ãä¸æ¬¡ãã­ã¥ã¼ããã¯ã¹ãã©ã¤ã³ãããã³ã©ã³ãã§ã¹ã®å ´åãåã¿ã¼ã²ãããã¯ã»ã«ã«å¯¾ãã¦ãå¯ä¸ããã½ã¼ã¹ãã¯ã»ã«ã®éã¿ãã¼ã­ã«è¨­å®ããããã¹ã¯ãããã¨ãã«ããããç¡è¦ãã¾ããä¸æ¬¡ã«ã¯è¿½å ã®ç¹ç°æ§ãããã¾ãï¼ã«ã¼ãã«åã®éã¿ã®ä¸é¨ãè² ã§ãããã¨ãèæ®ããã¨ããã®ãããªæ¦ç¥ã¯ãæå¹ãªãã¯ã»ã«ã¨ç¡å¹ãªãã¯ã»ã«ã®äº¤äºãããå ´åã«å¼·ããªã¼ãã¼ã·ã¥ã¼ã/ã¢ã³ãã¼ã·ã¥ã¼ãã«ã¤ãªããå¯è½æ§ãããã¾ãããããã£ã¦ãæ°´å¹³æ¹åã¾ãã¯åç´æ¹åã®ããããã§ãåæ¬¡åã®æå¹ãªã½ã¼ã¹ãã¯ã»ã«ã®æå¤§æ°ãåãµã³ããªã³ã°ã«ã¼ãã«ã®åå¾ãããå°ãªãå ´åãã¿ã¼ã²ãããã¯ã»ã«ã¯nodataã¨è¦ãªããã¾ãã æè¿åã®åãµã³ããªã³ã°ã®å ´åãåã¿ã¼ã²ãããã¯ã»ã«ã«å¯¾ãã¦ãå¯ä¸ããå¯è½æ§ã®ããã½ã¼ã¹ãã¯ã»ã«ã®1ã¤ãé¸æããã¾ã(å®è£åºæã®æ¹æ³)ããã®å¤ã¯æå¹ã§ãããã¨ç¡å¹ã§ãããã¨ãã®ã¾ã¾ä½¿ç¨ããã¾ãã ä»ã®åãµã³ããªã³ã°æ¹æ³ã®å ´åãã¿ã¼ã²ãããã¯ã»ã«ã«å¯ä¸ããã½ã¼ã¹ãã¯ã»ã«ããã¹ã¯ããã¦ããå ´åã¯ç¡è¦ããã¾ããæå¹ãªãã®ã ããèæ®ããã¾ãããªãå ´åãã¿ã¼ã²ãããã¯ã»ã«ã¯nodataã¨è¦ãªããã¾ãã ã¿ã¼ã²ããè§£ååº¦ãè¨­å®ãã¾ããå¤ã¯å°çåç§åä½ã§è¡¨ç¾ãããå¿è¦ãããã¾ããä¸¡æ¹ã¨ãæ­£ã®å¤ã§ãªããã°ãªãã¾ãããããã¯ã :option:`-outsize`, :option:`-a_ullr`, and :option:`-a_gt` ã¨ç¸äºã«æä»ãªã®ã§ãä¸¡ç«ã¯ã§ããªãã§ãã 