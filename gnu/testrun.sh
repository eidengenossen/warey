#!/bin/bash
builddir=`dirname "$0"`
GCONV_PATH="${builddir}/iconvdata"

usage () {
cat << EOF
Usage: $0 [OPTIONS] <program> [ARGUMENTS...]

  --tool=TOOL  Run with the specified TOOL. It can be strace, rpctrace,
               valgrind or container. The container will run within
               support/test-container.  For strace and valgrind,
               additional arguments can be passed after the tool name.
EOF

  exit 1
}

toolname=default
while test $# -gt 0 ; do
  case "$1" in
    --tool=*)
      toolname="${1:7}"
      shift
      ;;
    --*)
      usage
      ;;
    *)
      break
      ;;
  esac
done

if test $# -eq 0 ; then
  usage
fi

case "$toolname" in
  default)
    exec   env GCONV_PATH="${builddir}"/iconvdata LOCPATH="${builddir}"/localedata LC_ALL=C  "${builddir}"/elf/ld-linux-x86-64.so.2 --library-path "${builddir}":"${builddir}"/math:"${builddir}"/elf:"${builddir}"/dlfcn:"${builddir}"/nss:"${builddir}"/nis:"${builddir}"/rt:"${builddir}"/resolv:"${builddir}"/mathvec:"${builddir}"/support:"${builddir}"/misc:"${builddir}"/debug:"${builddir}"/nptl:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/ ${1+"$@"}
    ;;
  strace*)
    exec $toolname  -EGCONV_PATH=/home/eidengenossen/code/ware/warey/gnu/iconvdata  -ELOCPATH=/home/eidengenossen/code/ware/warey/gnu/localedata  -ELC_ALL=C  /home/eidengenossen/code/ware/warey/gnu/elf/ld-linux-x86-64.so.2 --library-path /home/eidengenossen/code/ware/warey/gnu:/home/eidengenossen/code/ware/warey/gnu/math:/home/eidengenossen/code/ware/warey/gnu/elf:/home/eidengenossen/code/ware/warey/gnu/dlfcn:/home/eidengenossen/code/ware/warey/gnu/nss:/home/eidengenossen/code/ware/warey/gnu/nis:/home/eidengenossen/code/ware/warey/gnu/rt:/home/eidengenossen/code/ware/warey/gnu/resolv:/home/eidengenossen/code/ware/warey/gnu/mathvec:/home/eidengenossen/code/ware/warey/gnu/support:/home/eidengenossen/code/ware/warey/gnu/misc:/home/eidengenossen/code/ware/warey/gnu/debug:/home/eidengenossen/code/ware/warey/gnu/nptl:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/ ${1+"$@"}
    ;;
  rpctrace)
    exec rpctrace  -EGCONV_PATH=/home/eidengenossen/code/ware/warey/gnu/iconvdata  -ELOCPATH=/home/eidengenossen/code/ware/warey/gnu/localedata  -ELC_ALL=C  /home/eidengenossen/code/ware/warey/gnu/elf/ld-linux-x86-64.so.2 --library-path /home/eidengenossen/code/ware/warey/gnu:/home/eidengenossen/code/ware/warey/gnu/math:/home/eidengenossen/code/ware/warey/gnu/elf:/home/eidengenossen/code/ware/warey/gnu/dlfcn:/home/eidengenossen/code/ware/warey/gnu/nss:/home/eidengenossen/code/ware/warey/gnu/nis:/home/eidengenossen/code/ware/warey/gnu/rt:/home/eidengenossen/code/ware/warey/gnu/resolv:/home/eidengenossen/code/ware/warey/gnu/mathvec:/home/eidengenossen/code/ware/warey/gnu/support:/home/eidengenossen/code/ware/warey/gnu/misc:/home/eidengenossen/code/ware/warey/gnu/debug:/home/eidengenossen/code/ware/warey/gnu/nptl:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/ ${1+"$@"}
    ;;
  valgrind*)
    exec env GCONV_PATH=/home/eidengenossen/code/ware/warey/gnu/iconvdata LOCPATH=/home/eidengenossen/code/ware/warey/gnu/localedata LC_ALL=C $toolname  /home/eidengenossen/code/ware/warey/gnu/elf/ld-linux-x86-64.so.2 --library-path /home/eidengenossen/code/ware/warey/gnu:/home/eidengenossen/code/ware/warey/gnu/math:/home/eidengenossen/code/ware/warey/gnu/elf:/home/eidengenossen/code/ware/warey/gnu/dlfcn:/home/eidengenossen/code/ware/warey/gnu/nss:/home/eidengenossen/code/ware/warey/gnu/nis:/home/eidengenossen/code/ware/warey/gnu/rt:/home/eidengenossen/code/ware/warey/gnu/resolv:/home/eidengenossen/code/ware/warey/gnu/mathvec:/home/eidengenossen/code/ware/warey/gnu/support:/home/eidengenossen/code/ware/warey/gnu/misc:/home/eidengenossen/code/ware/warey/gnu/debug:/home/eidengenossen/code/ware/warey/gnu/nptl:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/ ${1+"$@"}
    ;;
  container)
    exec env GCONV_PATH=/home/eidengenossen/code/ware/warey/gnu/iconvdata LOCPATH=/home/eidengenossen/code/ware/warey/gnu/localedata LC_ALL=C  /home/eidengenossen/code/ware/warey/gnu/elf/ld-linux-x86-64.so.2 --library-path /home/eidengenossen/code/ware/warey/gnu:/home/eidengenossen/code/ware/warey/gnu/math:/home/eidengenossen/code/ware/warey/gnu/elf:/home/eidengenossen/code/ware/warey/gnu/dlfcn:/home/eidengenossen/code/ware/warey/gnu/nss:/home/eidengenossen/code/ware/warey/gnu/nis:/home/eidengenossen/code/ware/warey/gnu/rt:/home/eidengenossen/code/ware/warey/gnu/resolv:/home/eidengenossen/code/ware/warey/gnu/mathvec:/home/eidengenossen/code/ware/warey/gnu/support:/home/eidengenossen/code/ware/warey/gnu/misc:/home/eidengenossen/code/ware/warey/gnu/debug:/home/eidengenossen/code/ware/warey/gnu/nptl:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/ /home/eidengenossen/code/ware/warey/gnu/support/test-container env GCONV_PATH=/home/eidengenossen/code/ware/warey/gnu/iconvdata LOCPATH=/home/eidengenossen/code/ware/warey/gnu/localedata LC_ALL=C  /home/eidengenossen/code/ware/warey/gnu/elf/ld-linux-x86-64.so.2 --library-path /home/eidengenossen/code/ware/warey/gnu:/home/eidengenossen/code/ware/warey/gnu/math:/home/eidengenossen/code/ware/warey/gnu/elf:/home/eidengenossen/code/ware/warey/gnu/dlfcn:/home/eidengenossen/code/ware/warey/gnu/nss:/home/eidengenossen/code/ware/warey/gnu/nis:/home/eidengenossen/code/ware/warey/gnu/rt:/home/eidengenossen/code/ware/warey/gnu/resolv:/home/eidengenossen/code/ware/warey/gnu/mathvec:/home/eidengenossen/code/ware/warey/gnu/support:/home/eidengenossen/code/ware/warey/gnu/misc:/home/eidengenossen/code/ware/warey/gnu/debug:/home/eidengenossen/code/ware/warey/gnu/nptl:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/:/usr/lib/gcc/x86_64-redhat-linux/15/../../../../lib64/ ${1+"$@"}
    ;;
  *)
    usage
    ;;
esac
