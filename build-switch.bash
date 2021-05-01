
set -e

export PREFIXARCHIVE=$(realpath python27-switch.tar.gz)

source $DEVKITPRO/switchvars.sh
pushd Python-2.7.18
mkdir build-switch
cp ../cpython_config_files/config.site build-switch
pushd build-switch
mkdir local_prefix
export LOCAL_PREFIX=$(realpath local_prefix)
../configure LDFLAGS="-specs=$DEVKITPRO/libnx/switch.specs $LDFLAGS" CONFIG_SITE="config.site" --host=aarch64-none-elf --build=$(../config.guess) --prefix="$LOCAL_PREFIX" --disable-ipv6 --disable-shared --enable-optimizations
popd
cp ../cpython_config_files/Setup.local build-switch/Modules
pushd build-switch
make -j $(getconf _NPROCESSORS_ONLN) libpython2.7.a
mkdir -p $LOCAL_PREFIX/lib
cp libpython2.7.a $LOCAL_PREFIX/lib/libpython2.7.a
make libinstall
make inclinstall
popd
popd

tar -czvf $PREFIXARCHIVE -C $LOCAL_PREFIX .
