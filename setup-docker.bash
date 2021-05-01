
docker run -d --name switchdev --workdir /build/git -v "${PWD}:/build/git" devkitpro/devkita64:20210306 tail -f /dev/null
docker exec switchdev /bin/bash -c 'dkp-pacman -Sy --noconfirm devkitpro-pkgbuild-helpers'
docker exec switchdev /bin/bash -c 'apt-get -y update'
docker exec switchdev /bin/bash -c 'apt-get -y install python libc6-dev'
