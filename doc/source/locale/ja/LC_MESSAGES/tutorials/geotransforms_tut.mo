Þ          ¤               ,  3   -  Â   a     $     :     V  '  u  M     H   ë  Y   4  -     '   ¼  (   ä  +     H   9  +     T   ®      A     ´   Å  !   z          ¶    Í  7   Ý	  4   
  V   J
  6   ¡
  5   Ø
  *     ,   9  4   f  *     c   Æ   A geotransform consists in a set of 6 coefficients: A geotransform is an affine transformation from the image coordinate space (row, column), also known as (pixel, line) to the georeferenced coordinate space (projected or geographic coordinates). Geotransform Tutorial In case of north up images: Introduction to Geotransforms: Note that the pixel/line coordinates in the above are from (0.0,0.0) at the top left corner of the top left pixel to (width_in_pixels,height_in_pixels) at the bottom right corner of the bottom right pixel. The pixel/line location of the center of the top left pixel would therefore be (0.5,0.5). Transformation from image coordinate space to georeferenced coordinate space: ``GT(0)`` x-coordinate of the upper-left corner of the upper-left pixel. ``GT(0)``, ``GT(3)`` position is the top left corner of the top left pixel of the raster. ``GT(1)`` w-e pixel resolution / pixel width. ``GT(1)``, ``GT(5)`` is the pixel size. ``GT(2)`` row rotation (typically zero). ``GT(2)``, ``GT(4)`` coefficients are zero. ``GT(3)`` y-coordinate of the upper-left corner of the upper-left pixel. ``GT(4)`` column rotation (typically zero). ``GT(5)`` n-s pixel resolution / pixel height (negative value for a north-up image). Project-Id-Version: GDAL 
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
 å°çå¤æã¯ã6ã¤ã®ä¿æ°ã®ã»ããã§æ§æããã¾ã: å°çå¤æã¯,ç»ååº§æ¨ç©ºéï¼è¡,åï¼,ã¾ãã¯ï¼ãã¯ã»ã«,ã©ã¤ã³ï¼ãã,å°çåº§æ¨ç©ºéï¼æå½±åº§æ¨ã¾ãã¯å°çåº§æ¨ï¼ã¸ã®ã¢ãã£ã³å¤æã§ã. å°çå¤æãã¥ã¼ããªã¢ã« ååãç»åã®å ´å: å°çå¤æã®ç´¹ä»: ä¸è¨ã®ãã¯ã»ã«/ã©ã¤ã³åº§æ¨ã¯,å·¦ä¸ã®ãã¯ã»ã«ã®å·¦ä¸ã®(0.0,0.0)ãããå³ä¸ã®ãã¯ã»ã«ã®å³ä¸ã®(width_in_pixels,height_in_pixels)ã¾ã§ã§ã.ãããã£ã¦,å·¦ä¸ã®ãã¯ã»ã«ã®ä¸­å¿ã®ãã¯ã»ã«/ã©ã¤ã³ã®ä½ç½®ã¯(0.5,0.5)ã§ã. ç»ååº§æ¨ç©ºéããå°çåº§æ¨ç©ºéã¸ã®å¤æ:  ``GT(0)`` å·¦ä¸ã®ãã¯ã»ã«ã®å·¦ä¸ã®xåº§æ¨.  ``GT(0)``, ``GT(3)`` ä½ç½®ã¯ã©ã¹ã¿ã®å·¦ä¸ã®ãã¯ã»ã«ã®å·¦ä¸ã®è§ã§ã.  ``GT(1)`` w-eãã¯ã»ã«è§£ååº¦ / ãã¯ã»ã«å¹.  ``GT(1)``, ``GT(5)`` ã¯ãã¯ã»ã«ãµã¤ãºã§ã.  ``GT(2)`` è¡ã®åè»¢ï¼éå¸¸ã¼ã­ï¼.  ``GT(2)``, ``GT(4)`` ä¿æ°ã¯ã¼ã­ã§ã.  ``GT(3)`` å·¦ä¸ã®ãã¯ã»ã«ã®å·¦ä¸ã®yåº§æ¨.  ``GT(4)`` åã®åè»¢ï¼éå¸¸ã¼ã­ï¼.  ``GT(5)`` n-sãã¯ã»ã«è§£ååº¦ / ãã¯ã»ã«é«ãï¼ååãç»åã®å ´åã¯è² ã®å¤ï¼. 