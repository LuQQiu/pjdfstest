#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/open/00.t 211352 2010-08-15 21:24:17Z pjd $

desc="open opens (and eventually creates) a file"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..2"

n0=`namegen`
n1=`namegen`
n2=`namegen`

expect 0 mkdir ${n0} 0755
cdir=`pwd`
cd ${n0}

# rename file to empty dir
expect 0 create ${n1} 0644
expect 0 mkdir ${n2} 0755
expect EISDIR rename ${n1} ${n2}

# rename dir to file
expect 0 rename ${n2} ${n1}
