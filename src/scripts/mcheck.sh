#!/bin/bash

SRCDIR="./WoWTests/target/working/WoWTests/"
SRCFILE="wowStubs.lua"
DIFF="diff --unchanged-line-format= --old-line-format= --new-line-format='%L'"
DIFF="/Applications/DiffMerge.app/Contents/MacOS/DiffMerge"

pushd $SRCDIR

SRCFILEMD5=`md5 -q $SRCFILE`

popd

echo $SRCFILEMD5

find $PWD -name $SRCFILE -exec md5 {} + > md5.out

echo ">>> These files are different from $SRCDIR$SRCFILE"

grep -v $SRCFILEMD5 md5.out

######
echo "---------------"



#find $PWD -name $SRCFILE -ok diff --unchanged-line-format= --old-line-format= --new-line-format='%L' $SRCDIR$SRCFILE {} ';'
find $PWD -name $SRCFILE -ok $DIFF $SRCDIR$SRCFILE {} ';'
for d in `ls -d */`; do pushd $d; git st | grep -i "$SRCFILE"; popd > /dev/null ; done


##
## CHANGE=$(diff ${BASEFILE}.previous ${BASEFILE}.new | wc -l)
## if [ ${CHANGE} -ne 0 ]; then {
##     ( echo ${TAG} && diff --unchanged-line-format= --old-line-format= --new-line-format='%L' ${BASEFILE}.previous ${BASEFILE}.new ) | terminal-notifier -open ${CLICKURL} -message
##  }; fi
## ( diff --unchanged-line-format= --old-line-format= --new-line-format='%L' ${BASEFILE}.previous ${BASEFILE}.new ) | say
## mv ${BASEFILE}.new ${BASEFILE}.previous
