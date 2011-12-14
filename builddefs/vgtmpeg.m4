VGTMPEG_CONFIGURE_BASE_OPT = --prefix=$(prefix) --enable-doc

ifeq ($(buildtype),linux-x86_64)
	VGTMPEG_CONFIGURE_BASE_OPT += --enable-pthreads --arch=x86_64
endif

ifeq ($(buildtype),linux-x86_32)
	VGTMPEG_CONFIGURE_BASE_OPT += --enable-pthreads --arch=x86_32 --enable-cross-compile --target-os=linux
endif

ifeq ($(buildtype),windows-x86_32)
	VGTMPEG_CONFIGURE_BASE_OPT +=  --enable-pthreads --arch=i386 --enable-cross-compile --target-os=mingw32 --cross-prefix=i586-mingw32msvc- --enable-memalign-hack  --extra-cflags=-DPTW32_STATIC_LIB
    export LIBX264_OPT_LIBS= -lpthreadGC2 

endif

ifeq ($(buildtype),darwin-x86_32)
	VGTMPEG_CONFIGURE_BASE_OPT +=  --enable-pthreads --arch=i386
endif

ifeq ($(buildtype),darwin-x86_64)
	VGTMPEG_CONFIGURE_BASE_OPT +=  --enable-pthreads  --arch=x86_64
endif

DEFMOD([vgtmpeg],[master], [vgtmpeg], [git], [$(BB_GIT_BASE)] )
DEFMOD_COPT([vgtmpeg],[$(VGTMPEG_CONFIGURE_BASE_OPT)])
