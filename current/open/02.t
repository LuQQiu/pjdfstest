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
expect 0 mkdir ${n1} 0000
expect dir,0000 lstat ${n1} type,mode
# execute permission only
expect 0 mkdir ${n2} 0100
expect dir,0100 lstat ${n2} type,mode
# write permission only
expect 0 mkdir ${n3} 0200
expect dir,0200 lstat ${n3} type,mode
# write and execute permissions
expect 0 mkdir ${n4} 0300
expect dir,0300 lstat ${n4} type,mode
# read permission only, fuse failed EIO
expect 0 mkdir ${n5} 0400
expect dir,0400 lstat ${n5} type,mode
# read and execute permission
expect 0 mkdir ${n6} 0500
expect dir,0500 lstat ${n6} type,mode
# read and write permission
expect 0 mkdir ${n7} 0600
expect dir,0600 lstat ${n7} type,mode
# read, write, and execute permission
expect 0 mkdir ${n8} 0700
expect dir,0700 lstat ${n8} type,mode
