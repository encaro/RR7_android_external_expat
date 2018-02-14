#!/bin/sh

set -e

if [ "$1" = "" ]; then
   echo "usage: $0 expat.tar.bz2"
   exit 1
fi

echo "Extracting $1"
tar --extract --bzip2 --strip-components=1 --file $1

echo "Saving COPYING to NOTICE"
touch MODULE_LICENSE_BSD_LIKE
mv COPYING NOTICE

echo "Fixing expat_config.h"
sed -i 's/\#define\sHAVE_GETRANDOM\s1/\/\* \#undef HAVE_GETRANDOM \*\//' expat_config.h

echo "Removing unnecessary files"
rm CMake.README
rm CMakeLists.txt
rm ConfigureChecks.cmake
rm Makefile.am
rm Makefile.in
rm aclocal.m4
rm configure
rm configure.ac
rm run.sh.in
rm test-driver-wrapper.sh
rm doc/Makefile.am
rm doc/Makefile.in
rm expat.pc.in
rm expat.sln
rm expat_config.h.cmake
rm expat_config.h.in
rm examples/Makefile.am
rm examples/Makefile.in
rm examples/elements.vcxproj
rm examples/elements.vcxproj.filters
rm examples/outline.vcxproj
rm examples/outline.vcxproj.filters
rm lib/Makefile.am
rm lib/Makefile.in
rm lib/expat.vcxproj
rm lib/expat.vcxproj.filters
rm lib/expat_static.vcxproj
rm lib/expat_static.vcxproj.filters
rm lib/expatw.vcxproj
rm lib/expatw.vcxproj.filters
rm lib/expatw_static.vcxproj
rm lib/expatw_static.vcxproj.filters
rm lib/libexpat.def
rm lib/libexpatw.def
rm lib/winconfig.h
rm tests/Makefile.am
rm tests/Makefile.in
rm tests/benchmark/Makefile.am
rm tests/benchmark/Makefile.in
rm tests/benchmark/benchmark.sln
rm tests/benchmark/benchmark.vcxproj
rm tests/runtests.sln
rm tests/runtests.vcxproj
rm tests/runtests.vcxproj.filters
rm tests/xmltest.log.expected

rm -rf conftools
rm -rf m4
rm -rf win32
rm -rf xmlwf

echo "Import complete"
