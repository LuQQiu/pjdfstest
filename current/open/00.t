#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/open/00.t 211352 2010-08-15 21:24:17Z pjd $

desc="open opens (and eventually creates) a file"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..10"

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
expect 1 open ${n1} O_RDWR,O_CREAT,O_EXCL 0000 : write 0 x : fstat 0 size
# execute permission only
expect 1 open ${n2} O_RDWR,O_CREAT,O_EXCL 0100 : write 0 x : fstat 0 size
# write permission only
expect 1 open ${n3} O_RDWR,O_CREAT,O_EXCL 0200 : write 0 x : fstat 0 size
# write and execute permissions
expect 1 open ${n4} O_RDWR,O_CREAT,O_EXCL 0300 : write 0 x : fstat 0 size
# read permission only, fuse failed EIO
expect 1 open ${n5} O_RDWR,O_CREAT,O_EXCL 0400 : write 0 x : fstat 0 size
# read and execute permission
expect 1 open ${n6} O_RDWR,O_CREAT,O_EXCL 0500 : write 0 x : fstat 0 size
# read and write permission
expect 1 open ${n7} O_RDWR,O_CREAT,O_EXCL 0600 : write 0 x : fstat 0 size
# read, write, and execute permission
expect 1 open ${n8} O_RDWR,O_CREAT,O_EXCL 0700 : write 0 x : fstat 0 size
