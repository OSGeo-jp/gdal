��          L               |   �   }   �   T    �  �        �    �    |  �   �  P  n  3  �  -   �	   Before GDAL 3.5, it is recommended to use `find module supplied with CMake <https://cmake.org/cmake/help/latest/module/FindGDAL.html>`__. This also creates the ``GDAL::GDAL`` target. It requires CMake version 3.14. By adding the imported library target ``GDAL::GDAL`` to the target link libraries, CMake will also pass the include directories to the compiler. The CMake command ``find_package`` will look for the configuration in a number of places. The lookup can be adjusted for all packages by setting the cache variable or environment variable ``CMAKE_PREFIX_PATH``. In particular, CMake will consult (and set) the cache variable ``GDAL_DIR``. The recommended way to use the GDAL library 3.5 or higher in a CMake project is to link to the imported library target ``GDAL::GDAL`` provided by the CMake configuration which comes with the library. Typical usage is: Using GDAL in CMake projects Project-Id-Version: GDAL 
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
 GDAL 3.5 より前では,`CMake で提供される検索モジュール <https://cmake.org/cmake/help/latest/module/FindGDAL.html>`__ を使用することをお勧めします.これは ``GDAL::GDAL`` ターゲットも作成します. CMake バージョン 3.14 が必要です. インポートされたライブラリターゲット ``GDAL::GDAL`` をターゲットリンクライブラリに追加することで,CMake はコンパイラにインクルードディレクトリを渡します. CMake コマンド ``find_package`` は,構成をいくつかの場所で検索します.検索は,キャッシュ変数または環境変数 ``CMAKE_PREFIX_PATH`` を設定することですべてのパッケージに調整できます.特に,CMake はキャッシュ変数 ``GDAL_DIR`` を参照して(および設定して)います. GDAL ライブラリ 3.5 以上を CMake プロジェクトで使用する推奨される方法は,ライブラリに付属する CMake 構成で提供されるインポートされたライブラリターゲット ``GDAL::GDAL`` にリンクすることです.典型的な使用法は次のとおりです: Cmake プロジェクトでの GDAL の利用 