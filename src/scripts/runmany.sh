#!/bin/bash
ant clean
mkdir -p target/reports
for n in $(seq -f "%05g" 9999 1) ; do
	#echo "Running run $n"
	reportFile="target/reports/testOut.xml"
	ant test > target/reports/antout.txt
	if [ ! "$?" == "0" ]; then
		cp target/reports/antout.txt target/reports/antOut$n.txt
		#mv $reportFile target/reports/testOut$n.xml
		ls -alt $reportFile
		until $(~/Scripts/checkFileChanged.sh ./test/test.lua); do
			sleep 1
		done
	else
		#ls -alt $reportFile
		sleep 1
	fi
done
