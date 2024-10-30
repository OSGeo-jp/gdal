#!/bin/sh

set -eu

TAG=$1

ARCHIVE="gdal${TAG}doc.zip"
echo "Building ${ARCHIVE}..."

TMPDIR=gdaldoc

rm -f .doxygen_up_to_date
rm -rf build/html
rm -rf build/latex
make html

python3 -m sphinx -T -b latex -d build/doctrees -D language=en source build/latex
(cd build/latex && (latexmk -r latexmkrc -pdf -f -dvi- -ps- -jobname=gdal -interaction=nonstopmode || test -f gdal.pdf))

rm -rf "${TMPDIR}"
mkdir ${TMPDIR}
cp -r build/html/* ${TMPDIR}
rm -f ${TMPDIR}/gdal.pdf
cp build/latex/gdal.pdf ${TMPDIR}
ORIG_DIR=$PWD
cd ${TMPDIR}
wget https://download.osgeo.org/gdal/for_doc/javadoc.zip -O /tmp/javadoc.zip
unzip -q /tmp/javadoc.zip
cd ${ORIG_DIR}

rm -f "${ARCHIVE}"
zip -r "${ARCHIVE}" ${TMPDIR}/*
rm -rf "${TMPDIR}"
