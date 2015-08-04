INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_GNURADIO_PMT gnuradio-pmt)

if(PC_GNURADIO_PMT_FOUND)
  # look for include files
  FIND_PATH(
    GNURADIO_PMT_INCLUDE_DIRS
    NAMES pmt/pmt.h
    HINTS $ENV{GNURADIO_PMT_DIR}/include
          ${PC_GNURADIO_PMT_INCLUDE_DIRS}
          ${CMAKE_INSTALL_PREFIX}/include
    PATHS /usr/local/include
          /usr/include
    )

  # look for libs
  FIND_LIBRARY(
    GNURADIO_PMT_LIBRARIES
    NAMES libgnuradio-pmt.so
    HINTS $ENV{GNURADIO_PMT_DIR}/lib
          ${PC_GNURADIO_PMT_LIBDIR}
          ${CMAKE_INSTALL_PREFIX}/lib/
          ${CMAKE_INSTALL_PREFIX}/lib64/
    PATHS /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
    )

  set(GNURADIO_PMT_FOUND ${PC_GNURADIO_PMT_FOUND})
endif(PC_GNURADIO_PMT_FOUND)

INCLUDE(FindPackageHandleStandardArgs)
# do not check GNURADIO_PMT_INCLUDE_DIRS, is not set when default include path us used.
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GNURADIO_PMT DEFAULT_MSG GNURADIO_PMT_LIBRARIES)
MARK_AS_ADVANCED(GNURADIO_PMT_LIBRARIES GNURADIO_PMT_INCLUDE_DIRS)
