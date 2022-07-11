#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/open/00.t 211352 2010-08-15 21:24:17Z pjd $

desc="open opens (and eventually creates) a file"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..2"

n0=`namegen`
n1=`namegen`

expect 0 mkdir ${n1} 0755
cdir=`pwd`
cd ${n1}

expect 1 open ${n0} O_RDWR,O_CREAT,O_EXCL 0400 : write 0 x : fstat 0 size