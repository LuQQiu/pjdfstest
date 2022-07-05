#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/chown/05.t 211410 2010-08-17 06:08:09Z pjd $

desc="chown returns EACCES when search permission is denied for a component of the path prefix"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..18"

n0=`namegen`
n1=`namegen`
n2=`namegen`

expect 0 mkdir ${n0} 0755
cdir=`pwd`
cd ${n0}
expect 0 mkdir ${n1} 0755
expect 0 chown ${n1} 65534 65534
expect 0 -u 65534 -g 65534 create ${n1}/${n2} 0644
expect 0 -u 65534 -g 65533,65534 -- chown ${n1}/${n2} -1 65533
# expected 65534,65533, got 65534,65534
expect 65534,65533 -u 65534 -g 65534 stat ${n1}/${n2} uid,gid
