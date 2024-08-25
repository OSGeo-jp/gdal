Þ          ¬               <  C   =  ¢     )   $     N  $   h  i       ÷  ±    %   ¹    ß  c  å    I  Ã   g
     +  i  µ  U     G   u    ½  h   =  ó   ¦  @     %   Û  @     î  B     1  Q  P  0   ¢    Ó  Ñ  d  9  6    p  »     ^  G  g   ¦"  D   #   All GDAL public C functions and C++ methods are re-entrant, except: For example, with Debian/Ubuntu distributions, this can be done by installing the ``libtcmalloc-minimal4`` package and running the binary that executes GDAL with: GDAL API: re-entrant, but not thread-safe GDAL and multi-processing GDAL block cache and multi-threading It has been observed that scenarios that involve multi-threading reading or writing of raster datasets are prone to cause a high RAM usage, in particular when using the default dynamic memory allocator of Linux. Using the alternate `tcmalloc <https://github.com/google/tcmalloc>`__ memory allocator helps reducing the amount of virtual and resident memory used. Multi-threading POSIX fork() API should not be called during the middle of a GDAL operation, otherwise some structures like mutexes might appear to be locked forever in the forked process. If multi-processing is done, we recommend that processes are forked before any GDAL operation is done. Operating on the same GDALDataset instance in several sub-processes will generally lead to wrong results due to the underlying file descriptors being shared. RAM fragmentation and multi-threading The current design of the GDAL raster block cache allows concurrent reads of several datasets. However performance issues may arise when writing several datasets from several threads, due to lock contention in the global structures of the block cache mechanism. The exact meaning of the terms ``thread-safe`` or ``re-entrant`` is not fully standardized. We will use here the `QT definitions <https://doc.qt.io/qt-5/threads-reentrancy.html>`__. In particular, a C function or C++ method is said to be re-entrant if it can be called simultaneously from multiple threads, *but* only if each invocation uses its own data. The reason is that most implementations of GDALDataset or GDALRasterBand are stateful. A GDALDataset typically owns a file handle, and performs seek/read operations on it, thus not allowing concurrent access. Block cache related structures for a given GDALDataset are not thread-safe. Drivers also often implement lazy initialization strategies to access various metadata which are resolved only the first time the method to access them is invoked. Drivers may also rely on third-party libraries that expose objects that are not thread-safe. Those functions should not be called concurrently from several threads, and it is general best practice to call them from the main thread of the program at program initialization and termination. Those restrictions apply to the C and C++ ABI, and all languages bindings (unless they would take special precautions to serialize calls) Unless otherwise stated, no GDAL public C functions and C++ methods should be assumed to be thread-safe. That is you should not call simultaneously GDAL functions from multiple threads on the same data instance, or even instances that are closely related through ownership relationships. For example, for a multi-band raster dataset, it is not safe to call concurrently GDAL functions on different :cpp:class:`GDALRasterBand` instances owned by the same :cpp:class:`GDALDataset` instance (each thread should instead manipulate a distinct GDALDataset). Similarly for a GDALDataset owning several :cpp:class:`OGRLayer`. the general cleanup functions like :cpp:func:`GDALDestroy` or :cpp:func:`OSRCleanup`. the general initialization functions, like :cpp:func:`GDALAllRegister`. Project-Id-Version: GDAL 
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
 ãã¹ã¦ã®GDALå¬éCé¢æ°ã¨C++ã¡ã½ããã¯åå¥å¯è½ã§ãã, ä»¥ä¸ã®ä¾å¤ãããã¾ã: ãã¨ãã°, Debian/Ubuntuãã£ã¹ããªãã¥ã¼ã·ã§ã³ã§ã¯, ``libtcmalloc-minimal4`` ããã±ã¼ã¸ãã¤ã³ã¹ãã¼ã«ã, GDALãå®è¡ãããã¤ããªãæ¬¡ã®ããã«å®è¡ãããã¨ã§, ãããè¡ããã¨ãã§ãã¾ã: GDAL-API: åå¥å¯è½ã ããã¹ã¬ããã»ã¼ãã§ã¯ãªã GDALã¨ãã«ããã­ã»ãã·ã³ã° GDALãã­ãã¯ã­ã£ãã·ã¥ã¨ãã«ãã¹ã¬ããã£ã³ã° ã©ã¹ã¿ã¼ãã¼ã¿ã»ããã®èª­ã¿åãã¾ãã¯æ¸ãè¾¼ã¿ãè¡ããã«ãã¹ã¬ããã£ã³ã°ãå«ãã·ããªãªã¯,Linuxã®ããã©ã«ãã®åçã¡ã¢ãªã¢ã­ã±ã¼ã¿ãä½¿ç¨ãã¦ããå ´å, é«ãRAMä½¿ç¨éãå¼ãèµ·ããå¾åããããã¨ãè¦³å¯ããã¦ãã¾ã. ä»£æ¿ã® `tcmalloc  <https://github.com/google/tcmalloc>`__ ã¡ã¢ãªã¢ã­ã±ã¼ã¿ãä½¿ç¨ããã¨, ä½¿ç¨ãããä»®æ³ã¡ã¢ãªã¨å¸¸é§ã¡ã¢ãªã®éãæ¸ããã®ã«å½¹ç«ã¡ã¾ã. ãã«ãã¹ã¬ããã£ã³ã° GDALæä½ã®éä¸­ã§POSIX fork() APIãå¼ã³åºãã¹ãã§ã¯ããã¾ãã. ããããªãã¨, ãã©ã¼ã¯ããããã­ã»ã¹ã§ãã¥ã¼ããã¯ã¹ãªã©ã®æ§é ä½ãæ°¸é ã«ã­ãã¯ãããããã«è¦ããå¯è½æ§ãããã¾ã. ãã«ããã­ã»ãã·ã³ã°ãè¡ãå ´å, GDALæä½ãè¡ãåã«ãã­ã»ã¹ããã©ã¼ã¯ãããã¨ããå§ããã¾ã. è¤æ°ã®ãµããã­ã»ã¹ã§åãGDALDatasetã¤ã³ã¹ã¿ã³ã¹ã«æä½ãè¡ãã¨, åºã«ãªããã¡ã¤ã«ãã£ã¹ã¯ãªãã¿ãå±æããã¦ãããã, ä¸è¬çã«èª¤ã£ãçµæã«ãªãã¾ã. RAMã®æ­çåã¨ãã«ãã¹ã¬ããã£ã³ã° ç¾å¨ã®GDALã©ã¹ã¿ã¼ãã­ãã¯ã­ã£ãã·ã¥ã®è¨­è¨ã§ã¯, è¤æ°ã®ãã¼ã¿ã»ããã®åæèª­ã¿åããè¨±å¯ããã¦ãã¾ã. ãã ã, è¤æ°ã®ã¹ã¬ããããè¤æ°ã®ãã¼ã¿ã»ããã«æ¸ãè¾¼ãå ´å, ãã­ãã¯ã­ã£ãã·ã¥ã¡ã«ããºã ã®ã°ã­ã¼ãã«æ§é ä½ã§ã®ã­ãã¯ç«¶åã«ããããã©ã¼ãã³ã¹åé¡ãçºçããå¯è½æ§ãããã¾ã. ç¨èª  ``ã¹ã¬ããã»ã¼ã`` ã¾ãã¯ ``åå¥å¯è½`` ã®æ­£ç¢ºãªæå³ã¯å®å¨ã«æ¨æºåããã¦ãã¾ãã.ããã§ã¯, `QTã®å®ç¾© <https://doc.qt.io/qt-5/threads-reentrancy.html>`__ ãä½¿ç¨ãã¾ã. ç¹ã«, Cé¢æ°ã¾ãã¯C++ã¡ã½ããã¯, è¤æ°ã®ã¹ã¬ããããåæã«å¼ã³åºããã¨ãã§ããã¨è¨ããã¾ã. *ããã* åå¼ã³åºããç¬èªã®ãã¼ã¿ãä½¿ç¨ããå ´åã®ã¿, åå¥å¯è½ã§ããã¨ããã¾ã. ãã®çç±ã¯, GDALDatasetãGDALRasterBandã®ã»ã¨ãã©ã®å®è£ãç¶æãæã£ã¦ããããã§ã.GDALDatasetã¯éå¸¸, ãã¡ã¤ã«ãã³ãã«ãææã, ããã«å¯¾ãã¦ã·ã¼ã¯/èª­ã¿åãæä½ãè¡ããã,åæã¢ã¯ã»ã¹ãè¨±å¯ãã¾ãã. ç¹å®ã®GDALDatasetã«é¢é£ãããã­ãã¯ã­ã£ãã·ã¥é¢é£ã®æ§é ã¯ã¹ã¬ããã»ã¼ãã§ã¯ããã¾ãã. ãã©ã¤ãã¯, ãã¾ãã¾ãªã¡ã¿ãã¼ã¿ã«ã¢ã¯ã»ã¹ããããã®éå»¶åæåæ¦ç¥ãå®è£ãããã¨ããããã, ãããã®ã¡ã¿ãã¼ã¿ã«ã¢ã¯ã»ã¹ããããã®ã¡ã½ãããåãã¦å¼ã³åºãããã¨ãã«ã®ã¿è§£æ±ºããã¾ã. ãã©ã¤ãã¯ã¾ã, ã¹ã¬ããã»ã¼ãã§ãªããªãã¸ã§ã¯ããå¬éãããµã¼ããã¼ãã£ã©ã¤ãã©ãªã«ä¾å­ãããã¨ãããã¾ã. ãããã®é¢æ°ã¯è¤æ°ã®ã¹ã¬ããããåæã«å¼ã³åºãã¹ãã§ã¯ããã¾ãã.ã¾ã, ãã­ã°ã©ã ã®åæåã¨çµäºæã«ã¯, ä¸è¬çã«ãããã®é¢æ°ããã­ã°ã©ã ã®ã¡ã¤ã³ã¹ã¬ããããå¼ã³åºãã®ããã¹ããã©ã¯ãã£ã¹ã§ã. ãããã®å¶éã¯, Cããã³C++ã®ABI, ããã³ãã¹ã¦ã®è¨èªãã¤ã³ãã£ã³ã°ã«é©ç¨ããã¾ã(ç¹å¥ãªæ³¨æãæã£ã¦å¼ã³åºããç´ååããå ´åãé¤ã) ç¹ã«æå®ããã¦ããªãéã, GDALå¬éCé¢æ°ã¨C++ã¡ã½ããã¯ã¹ã¬ããã»ã¼ãã§ããã¨ä»®å®ãã¦ã¯ããã¾ãã. ã¤ã¾ã, åããã¼ã¿ã¤ã³ã¹ã¿ã³ã¹ã«å¯¾ãã¦è¤æ°ã®ã¹ã¬ããããåæã«GDALé¢æ°ãå¼ã³åºãã¹ãã§ã¯ããã¾ãã. ã¾ã, ææé¢ä¿ãéãã¦å¯æ¥ã«é¢é£ãã¦ããã¤ã³ã¹ã¿ã³ã¹ã«å¯¾ãã¦ãåæ§ã§ã. ãã¨ãã°, ãã«ããã³ãã©ã¹ã¿ã¼ãã¼ã¿ã»ããã®å ´å,åã :cpp:class:`GDALDataset` ã¤ã³ã¹ã¿ã³ã¹ã«ãã£ã¦ææããã¦ããç°ãªã :cpp:class:`GDALRasterBand` ã¤ã³ã¹ã¿ã³ã¹ã«å¯¾ãã¦åæã«GDALé¢æ°ãå¼ã³åºããã¨ã¯å®å¨ã§ã¯ããã¾ãã (åã¹ã¬ããã¯ä»£ããã«ç°ãªãGDALDatasetãæä½ããã¹ãã§ã). åæ§ã«, è¤æ°ã® :cpp:class:`OGRLayer` ãææããGDALDatasetã®å ´åãåæ§ã§ã. :cpp:func:`GDALDestroy` ã :cpp:func:`OSRCleanup` ã®ãããªä¸è¬çãªã¯ãªã¼ã³ã¢ããé¢æ°. :cpp:func:`GDALAllRegister` ã®ãããªä¸è¬çãªåæåé¢æ°. 