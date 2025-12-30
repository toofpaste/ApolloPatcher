#/bin/sh

export PREFIX=$THEOS/toolchain/Xcode11.xctoolchain/usr/bin/
make clean
make package

export -n PREFIX
make clean
make package THEOS_PACKAGE_SCHEME=rootless

if [ -f "$THEOS/makefiles/package/roothide.mk" ]; then
  export -n PREFIX
  make clean
  make package THEOS_PACKAGE_SCHEME=roothide
else
  echo "Skipping roothide package: scheme not available in current Theos checkout."
fi
