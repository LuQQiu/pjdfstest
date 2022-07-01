#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/mkdir/06.t 211352 2010-08-15 21:24:17Z pjd $

desc="mkdir returns EACCES when write permission is denied on the parent directory of the directory to be created"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..12"

n0="pjdfstest_fab65010e0195efd3ce5aef823fb6b6e"
n1="pjdfstest_016eac2eaf07ac1680233bf83eb863fb"
n2="pjdfstest_1224cf5c79e0949ca4f04744e68e7c46"

cdir=`pwd`
cd ${n0}
# FAILED 3
expect 0 -u 65534 -g 65534 mkdir ${n1}/${n2} 0755
