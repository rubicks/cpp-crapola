#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.


AC_PREREQ([2.68])

# define package information
AC_INIT([cpp-crapola],
        [0.0.1],
        [rubicks@users.noreply.github.com],
        [cpp-crapola],
        [https://github.com/rubicks/cpp-crapola])

AC_CONFIG_SRCDIR([configure.ac])

# configure automake
AM_INIT_AUTOMAKE

# configure autoconf
AC_CONFIG_HEADERS([config.h])

AC_CONFIG_MACRO_DIR([m4])

# check for programs
AC_PROG_AWK
AC_PROG_CC
AC_PROG_CC_C99
AC_PROG_CC_C_O
AC_PROG_CPP
AC_PROG_CXX
AC_PROG_CXXCPP
AC_PROG_INSTALL
AC_PROG_LIBTOOL
AC_PROG_LN_S
AC_PROG_MAKE_SET
#AC_USE_SYSTEM_EXTENSIONS
AC_LANG_PUSH([C++])

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h sys/time.h])
AC_HEADER_STDC

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

# checks for libraries
AX_BOOST_BASE([1.48],,AC_MSG_ERROR([no compatible boost library found]))
AX_CXX_HAVE_STD
AX_CXX_HAVE_STL

AC_CONFIG_FILES([Makefile])

AC_OUTPUT
