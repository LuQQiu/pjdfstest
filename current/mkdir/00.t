#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/mkdir/00.t 211352 2010-08-15 21:24:17Z pjd $

desc="mkdir creates directories"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..36"

n0=`namegen`
n1=`namegen`

cdir=`pwd`

# Need to support mkdir based on uid gid
# Uid/gid may not exist in system and uid may not belong to gid
# Failed 18 Fuse opendir releasedir, operation not permitted
expect 0 -u 65535 -g 65535 mkdir ${n0} 0755
# Failed 19
expect 65535,65535 lstat ${n0} uid,gid
