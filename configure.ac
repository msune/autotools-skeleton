m4_include([VERSION]) #Force reconf on VERSION change
AC_INIT(MY_PROJECT, m4_esyscmd_s(cat VERSION), john@doe.com, MyProject, http://github.com/msune/autotools-skeleton)

AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])

AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])

AC_PROG_INSTALL
AC_PROG_CC
AC_PROG_CXX
AM_PROG_CC_C_O
m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

PKG_PROG_PKG_CONFIG

AUTOCONF_ENV="SHELL=/bin/sh"

LT_INIT
AC_ENABLE_STATIC

# Some useful default flags
CFLAGS="-std=gnu89 -Werror -Wall $CFLAGS"
CXXFLAGS="-Werror -Wall $CXXFLAGS"
AC_DEFINE([__STDC_FORMAT_MACROS], [], [Description])

# Debug
m4_include([config_m4/debug.m4])

# Check for profiling mode
m4_include([config_m4/profiling.m4])

# Checking libs
m4_include([config_m4/versioning.m4])

# Output files
AC_CONFIG_FILES([
	Makefile

	src/Makefile
	src/subdir/Makefile

	test/Makefile
])

AC_OUTPUT
