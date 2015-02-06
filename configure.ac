# cpp-crapola/configure.ac

AC_PREREQ([2.68])

# define package information
AC_INIT([cpp-crapola],
        [m4_esyscmd_s([git describe --always --dirty])],
        [rubicks00@gmail.com],
        [cpp-crapola],
        [https://github.com/rubicks/cpp-crapola])

AC_CONFIG_SRCDIR([configure.ac])
AC_LANG_PUSH([C++])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])

AM_INIT_AUTOMAKE([subdir-objects])
LT_PREREQ([2.4])
LT_INIT([])


# check for programs

AX_CXX_COMPILE_STDCXX_11


# check for headers

AC_CHECK_HEADERS([cinttypes stdlib.h sys/time.h sys/resource.h])
AC_HEADER_STDC


# Checks for typedefs, structures, and compiler characteristics.

AC_TYPE_UINT8_T
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T
AC_TYPE_UINT64_T

AC_TYPE_INT8_T
AC_TYPE_INT16_T
AC_TYPE_INT32_T
AC_TYPE_INT64_T


# Checks for library functions.
#AC_CHECK_FUNCS([getrlimit],,AC_MSG_ERROR([getrlimit missing]))


# checks for libraries

AX_BOOST_BASE([1.46.0],,AC_MSG_ERROR([Boost >= v1.46.0 missing]))
AX_CXX_HAVE_STD
AX_CXX_HAVE_STL


AC_CONFIG_FILES([Makefile])

AC_OUTPUT
