#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/link/06.t 211352 2010-08-15 21:24:17Z pjd $

desc="link returns EACCES when a component of either path prefix denies search permission"

dir=`dirname $0`
. ${dir}/../misc.sh

require link

echo "1..18"

n0=`namegen`
n1=`namegen`
n2=`namegen`
n3=`namegen`
n4=`namegen`

expect 0 mkdir ${n0} 0755
cdir=`pwd`
cd ${n0}

expect 0 mkdir ${n1} 0755
expect 0 chown ${n1} 65534 65534
expect 0 mkdir ${n2} 0755
expect 0 chown ${n2} 65534 65534
expect 0 -u 65534 -g 65534 create ${n1}/${n3} 0644
