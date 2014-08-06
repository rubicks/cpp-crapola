# cpp-crapola/Makefile.am

ACLOCAL_AMFLAGS = -I m4

# AM_CPPFLAGS = -rdynamic
AM_CXXFLAGS = -Wall -Wextra -Werror -pedantic-errors -rdynamic
#AM_LDFLAGS = -s #-rdynamic

noinst_LIBRARIES = libbt.a
libbt_a_SOURCES =	\
    backtrace/bt.hpp	\
    backtrace/bt.cpp

bin_PROGRAMS = batr llrev spar

batr_SOURCES = backtrace/main.cpp
batr_LDADD = libbt.a

llrev_SOURCES =		\
    linkedlist/ll.hpp	\
    linkedlist/rev.hpp	\
    linkedlist/rev.cpp

spar_SOURCES = sparsity/main.cpp
