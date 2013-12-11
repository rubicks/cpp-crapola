#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.68])
AC_INIT([cpp-crapola], [0.0.1], [rubicks@users.noreply.github.com])
AC_CONFIG_HEADERS([config.h])
# AC_CONFIG_SRCDIR([config.h])
AC_CONFIG_MACRO_DIR([m4])

# Checks for programs.
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
# AC_USE_SYSTEM_EXTENSIONS

AM_INIT_AUTOMAKE

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h sys/time.h])

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

# checks for libraries
AX_BOOST_BASE([1.48])

AC_CONFIG_FILES([Makefile])

AC_OUTPUT
