Þ                        ì     í     ö  *   ú  &   %     L  M   a  b   ¯       !   (  0   J     {  ¿     «  Á     m               ¯     Ï  _   ß  *   ?     j               ¶     Î  ,   î  "        >  q  Ø     J
     Q
  P   U
  `   ¦
  7        ?     É  (   J  S   s  X   Ç  ­      Þ   Î    ­     °     È     Þ  "   û       j   1  S        ð          /     N  >   g  M   ¦  7   ô  â   ,   Contents FAQ GDAL - Geospatial Data Abstraction Library How do I add support for a new format? How do I cite GDAL ? I have a question that's not answered here. Where can I get more information? In late 1998, Frank Warmerdam started to work as independent professional on the GDAL/OGR library. Is GDAL thread-safe ? Is GDAL/OGR proprietary software? Is there a graphical user interface to GDAL/OGR? It is sometimes pronounced "goo-doll" (a bit like goo-gle), while others pronounce it "gee-doll," and others pronounce it "gee-dall." OGR used to be a separate vector IO library inspired by OpenGIS Simple Features which was separated from GDAL. With the GDAL 2.0 release, the GDAL and OGR components were integrated together. OGR used to stand for OpenGIS Simple Features Reference Implementation. However, since OGR is not fully compliant with the OpenGIS Simple Feature specification and is not approved as a reference implementation of the spec the name was changed to OGR Simple Features Library. The only meaning of OGR in this name is historical. OGR is also the prefix used everywhere in the source of the library for class names, filenames, etc. See :ref:`community` See :ref:`license` See :ref:`multithreading` See :ref:`software_using_gdal`: See `CITATION`_ To some extent this is now covered by the :ref:`raster_driver_tut` and :ref:`vector_driver_tut` What compiler can I use to build GDAL/OGR? What does CPL stand for? What does GDAL stand for? What does OGR stand for? What is this OGR stuff? What license does GDAL/OGR use? What operating systems does GDAL-OGR run on? When was the GDAL project started? `Listen <https://soundcloud.com/danabauer/how-do-you-pronounce-gdal#t=00:02:58>`__ how Frank Warmerdam prounounces it and the history behind the acronym. Project-Id-Version: GDAL 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2024-07-01 03:46+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ja
Language-Team: ja <LL@li.org>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.14.0
 ç®æ¬¡ FAQ GDAL - ç©ºéãã¼ã¿æ½è±¡ã©ã¤ãã©ãª(Geospatial Data Abstraction Library) æ°ãããã©ã¼ãããã®ãµãã¼ããè¿½å ããã«ã¯ã©ãããã°ããã§ããï¼ GDALãã©ã®ããã«å¼ç¨ããã°ããã§ããï¼ ããã§åç­ãããã¦ããªãè³ªåãããã¾ãã ãã®ãããªå ´åç§ã¯ã©ãã§æå ±ãå¾ããã¨ãã§ãã¾ãã? 1998å¹´å¾å, Frank Warmerdam ã¯ç¬ç«ããå°éå®¶ã¨ãã¦GDAL/OGR libraryã©ã¤ãã©ãªã®ä»äºãéå§ãã¾ããã GDALã¯ã¹ã¬ããã»ã¼ãã§ããï¼ GDAL/OGRã¯ãã­ãã©ã¤ã¨ã¿ãªã©ã¤ã»ã³ã¹ã®ã½ããã¦ã§ã¢ã§ããï¼ GDL/OGRã«ã¯ã°ã©ãã£ã«ã«ã¦ã¼ã¶ã¼ã¤ã³ã¿ã¼ãã§ã¼ã¹ãããã¾ããï¼ ããã¯æã "goo-doll" (å°ã goo-gleã«ä¼¼ã¦ã¾ã), ã¨çºé³ããã¾ã, ã¾ã ä»ã®äººå ´å "gee-doll," ã "gee-dall." ã¨çºé³ããããã¨ãããã¾ã OGR ã¯ OpenGIS Simple Features ã«ã¤ã³ã¹ãã¤ã¢ããããã¯ã¿IOã©ã¤ãã©ãªã§GDALã¨ã¯å¥ã®ãã®ã§ãããGDAL 2.0 ã®ãªãªã¼ã¹æã«ãGDAL ã¨ OGR ã®ã³ã³ãã¼ãã³ãã¯çµ±åããã¾ããã OGR ã¯ OpenGIS Simple Features Reference Implementationã®ç¥ç§°ã§ããã ãã ãOGR ã¯OpenGIS Simple Feature specificationã«å®å¨ã«æºæ ãã¦ãããã  ä»æ§ã®å®è£ã¨ãã¦ã¯æ¿èªããã¦ããªããããã®ååã¯ OGR Simple Features Libraryã«å¤æ´ãã¦ãã¾ããããã®ååã«ãããOGR ã¯æ­´å²çãªæå³ããããã¾ãããã¾ã OGRã¯ã©ã¤ãã©ãªã®ã½ã¼ã¹ã®ããããå ´æã§ã¯ã©ã¹å,ãã¡ã¤ã«åç­ã«å©ç¨ãããæ¥é ­èªã§ãããã¾ãã åç§ :ref:`community` åç§ :ref:`license` åç§ :ref:`multithreading` åç§ :ref:`software_using_gdal`: åç§ `CITATION`_ ç¾å¨ããç¨åº¦ã¯ :ref:`raster_driver_tut` ã¨ :ref:`vector_driver_tut` ã§èª¬æããã¦ãã¾ãã GDAL/OGRããã«ãããããã«ã©ã®ã³ã³ãã¤ã©ãä½¿ç¨ã§ãã¾ããï¼ CPLã¨ã¯ä½ã®ç¥ã§ããï¼ GDALã¨ã¯ä½ã®ç¥ã§ããï¼ OGRã¨ã¯ä½ã®ç¥ã§ããï¼ OGRã¨ã¯ä½ã§ããï¼ GDAL/OGRã¯ã©ã®ã©ã¤ã»ã³ã¹ãä½¿ç¨ãã¦ãã¾ããï¼ GDAL-OGRã¯ã©ã®ãªãã¬ã¼ãã£ã³ã°ã·ã¹ãã ã§åä½ãã¾ããï¼ GDALãã­ã¸ã§ã¯ãã¯ãã¤å§ã¾ãã¾ãããï¼ `ããã <https://soundcloud.com/danabauer/how-do-you-pronounce-gdal#t=00:02:58>`__ èãã¦ä¸ããã Frank Warmerdam ããããã©ãçºé³ãããã¨ GDALã®é ­å­èªã®æ­´å²ã«ã¤ãã¦èããã¨ãã§ãã¾ã. 