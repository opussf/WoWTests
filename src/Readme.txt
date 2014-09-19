Welcome to an uber simple Testing Framework for wow addons.

How to use:
1) Create a place to put these files.

I like this structure:
<projectRoot> |
			  + src
			  + test     <-- test files here

I use 'svn propedit svn:externals test'
^/WoWTests/trunk/src/wowTest.lua wowTest.lua
^/WoWTests/trunk/src/wowStubs.lua wowStubs.lua

To link the files in from a common location

2) Create 'test.lua' in the test directory.
Edit the file to read:
----
#!/usr/bin/env lua

require "wowTest"

test.outFileName = "../dest/testOut.xml"

-- Figure out how to parse the XML here, until then....

-- require the file to test
package.path = "../src/?.lua;'" .. package.path
require "<PluginCode>"
-----

Declare and describe the XML artifacts that will be interacted with in your addon, if they come from XML.
The testOut.xml file will default into the run location.
test.outFileName sets where the output file goes.

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
* Parse XML for frame info and create tables based on the contents
* Basic XML validation as a part of the XML parsing
* Multi-source (have not tested yet)


----------------
Test run data structure:
test.runInfo.count = number run
test.runInfo.fail = number failed
test.runInfo.testResults = {}  table of tests run
test.runInfo.testResults[testName] = {}
test.runInfo.testResults[testName].output = Stack trace / output for the test.
test.runInfo.testResults[testName].runtime = time to run test


