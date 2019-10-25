#! /bin/sh
#
# $Id: autogen.sh,v 1.15 2007-10-07 17:15:15 al-guest Exp $

AUTOMAKEVER=1.10

set -x

aclocal-$AUTOMAKEVER
[ "$?" != 0 ] && echo "aclocal-$AUTOMAKEVER not available or failed!" && exit 1
autoheader || exit 1
automake-$AUTOMAKEVER --add-missing --force --gnu || exit 1
autoconf || exit 1
