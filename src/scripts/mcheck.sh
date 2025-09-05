#!/bin/bash

TARGETLIMIT=$1

SRCDIR="./WoWTests/target/working/WoWTests/"
SRCFILE="wowStubs.lua"
DIFF="diff --unchanged-line-format= --old-line-format= --new-line-format='%L'"
DIFF="/Applications/DiffMerge.app/Contents/MacOS/DiffMerge"

# make sure src file exists, if not build it, or quit
if [ ! -f "${SRCDIR}${SRCFILE}" ]; then
	pushd "WoWTests"
	ant
	popd
	if [ ! -f "${SRCDIR}${SRCFILE}" ]; then
		echo "Something is wrong, check WoWTests project."
		exit 1
	fi
fi

compare_files() {
	SRCDIR=$1
	SRCFILE=$2
	LIMIT=$3

	# get the md5 of the src file
	SRCFILEMD5=`md5 -q "${SRCDIR}${SRCFILE}"`
	echo "MD5 (${SRCDIR}${SRCFILE}) = $SRCFILEMD5"

	# find all SRCFILES in subdirs, and get their md5, record to a file
	find $PWD -name $SRCFILE -exec md5 {} + > md5.out

	if [ ! -z "$LIMIT" ]; then
		cat md5.out | grep -v "$LIMIT" > md5.out2
	else
		mv md5.out md5.out2
	fi

	# show the files who are different
	echo ">>> These files are different from $SRCDIR$SRCFILE"
	grep -v $SRCFILEMD5 md5.out2 > md5.out
	rm md5.out2
	cat md5.out

	######
	echo "---------------"
	if [ -s md5.out ]; then
		echo "Run: $DIFF $SRCDIR$SRCFILE"
		while read line; do
			# find filenames of changes files
			CHANGEDFILE=`echo $line | grep -v $SRCFILEMD5 | cut -d'(' -f 2 | cut -d')' -f 1`
			if [ ! -z "$CHANGEDFILE" ]; then
				echo "  $CHANGEDFILE"
				$DIFF $SRCDIR$SRCFILE $CHANGEDFILE
				#echo "$?"
			fi
		done < md5.out
	fi
}

compare_files "./WoWTests/target/working/WoWTests/" "wowStubs.lua" "src"
compare_files "./WoWTests/target/working/WoWTests/" "wowTest.lua" "src"
compare_files "./WoWTests/src/scripts/" "runmany.sh" "."
compare_files "./WoWTests/.github/workflows/" "normal_test.yml"
compare_files "./WoWTests/.github/workflows/" "ontag.yml"
#compare_files "./WoWTests/buildFiles/" "build.xml"


# these worked, sort of..

#find $PWD -name $SRCFILE -ok diff --unchanged-line-format= --old-line-format= --new-line-format='%L' $SRCDIR$SRCFILE {} ';'
#find $PWD -name $SRCFILE -ok $DIFF $SRCDIR$SRCFILE {} ';'
#for d in `ls -d */`; do pushd $d; git st | grep -i "$SRCFILE"; popd > /dev/null ; done
for d in *; do
  if [ -d $d ]; then
    pushd $d;
    if [ -f build.xml ]; then
        ant test > ../$d.testrun && if [ $? ]; then rm ../$d.testrun; fi &
    fi
    popd
  fi
done
wait
rm failed.runs
for f in *.testrun; do
  cat $f >> failed.runs
  rm $f
done
cat failed.runs

##
## CHANGE=$(diff ${BASEFILE}.previous ${BASEFILE}.new | wc -l)
## if [ ${CHANGE} -ne 0 ]; then {
##     ( echo ${TAG} && diff --unchanged-line-format= --old-line-format= --new-line-format='%L' ${BASEFILE}.previous ${BASEFILE}.new ) | terminal-notifier -open ${CLICKURL} -message
##  }; fi
## ( diff --unchanged-line-format= --old-line-format= --new-line-format='%L' ${BASEFILE}.previous ${BASEFILE}.new ) | say
## mv ${BASEFILE}.new ${BASEFILE}.previous
