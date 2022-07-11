#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/open/00.t 211352 2010-08-15 21:24:17Z pjd $

desc="open opens (and eventually creates) a file"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..17"

n0=`namegen`
n1=`namegen`
n2=`namegen`
n3=`namegen`
n4=`namegen`
n5=`namegen`
n6=`namegen`
n7=`namegen`
n8=`namegen`

expect 0 mkdir ${n0} 0755
cdir=`pwd`
cd ${n0}
# no permission
expect 0 create ${n1} 0000
expect 0 lstat ${n1} size
# execute permission only
expect 0 create ${n2} 0100
expect 0 lstat ${n2} size
# write permission only
expect 0 create ${n3} 0200
expect 0 lstat ${n3} size
# write and execute permissions
expect 0 create ${n4} 0300
expect 0 lstat ${n4} size

# read permission only, fuse failed EIO
expect 0 create ${n5} 0400
expect 0 lstat ${n5} size
# read and execute permission
expect 0 create ${n6} 0500
expect 0 lstat ${n6} size
# read and write permission
expect 0 create ${n7} 0600
expect 0 lstat ${n7} size
# read, write, and execute permission
expect 0 create ${n8} 0700
expect 0 lstat ${n8} size
