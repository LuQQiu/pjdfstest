#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/mkdir/00.t 211352 2010-08-15 21:24:17Z pjd $

desc="mkdir creates directories"

dir=`dirname $0`
. ${dir}/../misc.sh

echo "1..36"

n0=`namegen`
n1=`namegen`

expect 0 mkdir ${n1} 0755
cdir=`pwd`
cd ${n1}

# POSIX: The directory's user ID shall be set to the process' effective user ID.
# The directory's group ID shall be set to the group ID of the parent directory
# or to the effective group ID of the process.
# Failed 17
expect 0 chown . 65535 65535
expect 0 -u 65535 -g 65535 mkdir ${n0} 0755
expect 65535,65535 lstat ${n0} uid,gid
expect 0 rmdir ${n0}
expect 0 -u 65535 -g 65534 mkdir ${n0} 0755
