
curl -LOC - https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz
rm -rf Python-2.7.18
tar -xf Python-2.7.18.tar.xz
pushd Python-2.7.18
patch -p1 < ../cpython.patch
popd
