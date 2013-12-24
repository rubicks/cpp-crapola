# cpp-crapola/Makefile.am

ACLOCAL_AMFLAGS = -I m4

# AM_CPPFLAGS = -rdynamic
AM_CXXFLAGS = -Wall -Wextra -Werror -pedantic-errors
#AM_LDFLAGS = -s #-rdynamic

noinst_LIBRARIES = libbt.a
libbt_a_SOURCES =			\
    $(top_srcdir)/backtrace/bt.hpp	\
    $(top_srcdir)/backtrace/bt.cpp
# libbt_a_CXXFLAGS = -rdynamic

bin_PROGRAMS = backtrace
backtrace_SOURCES = $(top_srcdir)/backtrace/main.cpp
# backtrace_CXXFLAGS = -rdynamic
backtrace_LDADD = libbt.a
