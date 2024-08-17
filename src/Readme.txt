Welcome to an uber simple Testing Framework for wow addons.

How to use:
1) Create a place to put these files.

I like this structure:
<projectRoot> |
			  + src
			  + test     <-- test files here

2) Create 'test.lua' in the test directory.
Edit the file to read:
----
#!/usr/bin/env lua

require "wowTest"

test.outFileName = "../dest/testOut.xml"
-- test.coberturaFileName = "../coverage.xml"  -- uncomment this to enable cobertura style coverage report

ParseTOC("../src/addon.toc") -- edit this to find the toc file

-- create frames not already created in ParseTOC here
frameName = CreateFrame("FrameName")
-----

3) Create 'before' and 'after' functions, if needed.
test.before()  and  test.after()

4) Create your test functions
test.testTESTNAME()

5) call test.run() at the very end.

How to run the tests.
*) Change to your test directory, and run test.lua.
'lua test.lua'

*) Using Ant, use the exec task.
	<exec executable="lua" dir="test">
		<arg value="test.lua"/>
	</exec>

---------------------
Known issues / bugs / todos
* Time is only 1 second accurate - needs lua socket library to enable more granular time
* Figure out command line parsing for controlling: File out, reporter, etc
* Better stubs - more of a simulation

----------------
Test run data structure:
test.runInfo.count = number run
test.runInfo.fail = number failed
test.runInfo.testResults = {}  table of tests run
test.runInfo.testResults[testName] = {}
test.runInfo.testResults[testName].output = Stack trace / output for the test.
test.runInfo.testResults[testName].runtime = time to run test


