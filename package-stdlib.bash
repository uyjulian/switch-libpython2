
set -e

export LOCAL_PREFIX=$(realpath Python-2.7.18/build-switch/local_prefix)
export PYTHONLIBZIP=$(realpath python27.zip)
export LIB_BUILD_DIR=./tmp_lib

rm -rf $LIB_BUILD_DIR $PYTHONLIBZIP
cp -as $LOCAL_PREFIX/lib/python2.7 $LIB_BUILD_DIR
rm -r $LIB_BUILD_DIR/test
rm -r $LIB_BUILD_DIR/lib2to3/tests
rm $LIB_BUILD_DIR/subprocess.py
ln -sf $(realpath pystub/subprocess.py) $LIB_BUILD_DIR/subprocess.py
pushd $LIB_BUILD_DIR
find . -type l -not -name \*.py -delete
find . -type d -empty -delete
find . -name \*.py -exec python2 -OO -m py_compile {} \;
7z a -l $PYTHONLIBZIP .
popd
