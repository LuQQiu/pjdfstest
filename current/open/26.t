#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/open/07.t 211352 2010-08-15 21:24:17Z pjd $

desc="open returns EACCES when O_TRUNC is specified and write permission is denied"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..25"

n0=`namegen`
n1=`namegen`

expect 0 mkdir ${n0} 0755
expect 0 chown ${n0} 65534 65534
cdir=`pwd`

expect 0 -u 65534 -g 65534 create ${n0}/${n1} 0644
expect 1 -u 65534 -g 65534 open ${n0}/${n1} O_WRONLY : write 0 x : fstat 0 size
# 7
expect 0 -u 65534 -g 65534 open ${n0}/${n1} O_RDONLY,O_TRUNC
# 8
expect 0 unlink ${n0}/${n1}
expect 0 chmod ${n0} 0777
expect 0 -u 65534 -g 65534 open ${n0}/${n1} O_RDONLY,O_CREAT 0644

