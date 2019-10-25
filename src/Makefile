#https://blog.csdn.net/hanglinux/article/details/51479948
#http://clfs.org/view/clfs-sysroot/arm/final-system/ncurses.html

export TOOLS=/opt/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf
export CROSS_COMPILE=$(TOOLS)/bin/arm-linux-gnueabihf
export CC=$(CROSS_COMPILE)-gcc
export CXX=$(CROSS_COMPILE)-g++
export RANLIB=$(CROSS_COMPILE)-ranlib

TDA2XX		:= $(PWD)/tda2xx_rootfs
CPPFLAGS 	:= -I$(TDA2XX)/include
LDFLAGS 	:= -L$(TDA2XX)/lib

all:
	mkdir -p $(TDA2XX)
	make ncurses-build
	make minicom-build
	make clean

ncurses-build:
	make nc_config
	pushd ncurses-5.5; make; popd
	pushd ncurses-5.5; make install; popd

minicom-build:
	make mi_config
	pushd minicom-2.3; make; popd
	pushd minicom-2.3; make install; popd

clean:
	pushd ncurses-5.5; make clean; popd
	pushd minicom-2.3; make clean; popd

config:
	make nc_config
	make mi_config

mi_config:
	pushd minicom-2.3; \
	./configure CC=arm-linux-gnueabihf-gcc --host=arm-linuxf \
	--prefix=$(TDA2XX) \
	CPPFLAGS="-I$(TDA2XX)/include/ncurses -I$(TDA2XX)/include" \
	LDFLAGS="-L$(TDA2XX)/lib -lncurses"; \
	popd

nc_config:
	pushd ncurses-5.5; \
	./configure CC=arm-linux-gnueabihf-gcc --host=arm-linux-gnueabihf \
	--prefix=$(TDA2XX) \
	--with-shared \
	CPPFLAGS=-I$(TOOLS)/include \
	LDFLAGS=-L$(TOOLS)/lib; \
	popd
