# Set application version based on the git version

#Default
LLCR_VERSION="$PACKAGE_VERSION" #Unknown (no GIT repository detected)"
FILE_VERSION=`cat $srcdir/VERSION`

#Since AC_INIT caches VERSION; force an autogen.sh
if test "$LLCR_VERSION" != "$FILE_VERSION"; 
then
	AC_MSG_ERROR("LLCR version file has been updated($LLCR_VERSION => $FILE_VERSION). Please regenerate Autoconf state by calling autogen.sh again.")
fi

AC_CHECK_PROG(ff_git,git,yes,no)

#Normalize
LLCR_VERSION_NORMALIZED=`echo $LLCR_VERSION | sed s/dev//g | sed s/RC.*//g | tr -d v`

#Substs
AC_SUBST([LLCR_VERSION], ["$LLCR_VERSION"])
AC_SUBST([LLCR_VERSION_NORMALIZED], ["$LLCR_VERSION_NORMALIZED"])

AC_MSG_CHECKING([the build version])
AC_MSG_RESULT([$LLCR_VERSION ($LLCR_VERSION_NORMALIZED)])

AC_MSG_CHECKING([the build number])
if test $ff_git = no
then
	AC_MSG_RESULT([git not found!])
else

	if test -d $srcdir/.git ; then
		#Try to retrieve the build number
		_LLCR_GIT_BUILD=`git log -1 --pretty=%H`
		_LLCR_GIT_BRANCH=`git rev-parse --abbrev-ref HEAD`
		_LLCR_GIT_DESCRIBE=`git describe --abbrev=40`

		AC_SUBST([LLCR_BUILD], ["$_LLCR_GIT_BUILD"])
		AC_SUBST([LLCR_BRANCH], ["$_LLCR_GIT_BRANCH"])
		AC_SUBST([LLCR_DESCRIBE], ["$_LLCR_GIT_DESCRIBE"])

	fi

	AC_MSG_RESULT([$_LLCR_GIT_BUILD])
fi
