# cpp-crapola/Makefile.am

ACLOCAL_AMFLAGS = -I m4

noinst_LIBRARIES = libbt.a
libbt_a_SOURCES =			\
    $(top_srcdir)/backtrace/bt.hpp	\
    $(top_srcdir)/backtrace/bt.cpp

bin_PROGRAMS = backtrace
backtrace_SOURCES = $(top_srcdir)/backtrace/main.cpp
backtrace_LDADD = libbt.a
