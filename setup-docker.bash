
docker run -d --name switchdev --workdir /build/git -v "${PWD}:/build/git" devkitpro/devkita64:20210514 tail -f /dev/null
curl -LOC - https://github.com/uyjulian/pacman-packages/releases/download/v2.2.3-1-pkgbuild-helpers/devkitpro-pkgbuild-helpers-2.2.3-1-any.pkg.tar.xz
docker exec switchdev /bin/bash -c 'dkp-pacman -U --noconfirm devkitpro-pkgbuild-helpers-2.2.3-1-any.pkg.tar.xz'
docker exec switchdev /bin/bash -c 'apt-get -y update'
docker exec switchdev /bin/bash -c 'apt-get -y install python libc6-dev'
