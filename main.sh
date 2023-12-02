#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://gitlab.com/CalcProgrammer1/OpenRGB src-pkg-openrgb
cp -rvf ./debian ./src-pkg-openrgb/
cd ./src-pkg-openrgb/

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
