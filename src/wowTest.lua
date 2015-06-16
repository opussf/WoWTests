-----------------------------------------
-- Author  :  Opussf
-- Date    :  $Date:$
-- VERSION :  @VERSION@
-----------------------------------------
-- This is an uber simple unit test implementation
-- It creates a dictionary called test.
-- Put the normal test functions in it like:
-- function test.before() would define what to do before each test
-- function test.after() would define what to do after each test
-- function test.testName() would define a test
-- Use test.run() at the end to run them all

require "wowStubs"

-- Basic assert functions
function assertEquals( expected, actual, msg )
	msg = msg or ("Failure: expected ("..(expected or "nil")..") actual ("..(actual or "nil")..")")
	if not actual or expected ~= actual then
		error( msg )
	else
		return 1    -- passed
	end
end
function assertIsNil( expected, msg )
	msg = msg or ("Failure: Expected nil value")
	if expected and expected ~= nil then
		error( msg )
	else
		return 1
	end
end
function assertTrue( actual, msg )
	msg = msg or ("Failure: "..(actual and "True" or "False").." did not test as true.")
	assert( actual, msg )
end
function assertFalse( actual, msg )
	if actual then
		msg = msg or ("Failure: "..(actual and "True" or "False").." did not test as false.")
		error( msg )
	else
		return 1
	end
end
function fail( msg )
	error( msg )
end

test = {}
test.outFileName = "testOut.xml"
test.runInfo = {
		["count"] = 0,
		["fail"] = 0,
		["time"] = 0,
		["testResults"] = {}
}

function test.print(...)
	-- ... = arg
	-- io.write(unpack(arg))
--	io.write("meh:", unpack(arg))
end

-- intercept the lua's print function
--print = test.print

function test.toXML()
	if test.outFileName then
		local f = assert( io.open( test.outFileName, "w"))
		f:write(string.format("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"))
		f:write(string.format(
				"<testsuite errors=\"0\" failures=\"%i\" name=\"Lua.Tests\" tests=\"%i\" time=\"%0.3f\" timestamp=\"%s\">\n",
				test.runInfo.fail, test.runInfo.count, test.runInfo.time, os.date("%Y-%m-%dT%X" ) ) )
		f:write(string.format("\t<properties/>\n"))
		for tName, tData in pairs( test.runInfo.testResults ) do
			f:write(string.format("\t<testcase classname=\"%s\" name=\"%s\" time=\"%0.3f\" ",
					"Lua.Tests", tName, tData.runTime ) )
			if tData.failed then
				f:write(string.format(">\n<failure type=\"%s\">%s\n</failure>\n</testcase>\n", "testFail", tData.output ) )
			else
				f:write("/>\n")
			end
		end

		f:write(string.format("</testsuite>\n"))
		f:close()
	end
end

function test.run()
	test.startTime = os.clock()
	test.runInfo.testResults = {}
	for fName in pairs( test ) do
		if string.match( fName, "^test.*" ) then
			local testStartTime = os.clock()
			test.runInfo.testResults[fName] = {}
			test.runInfo.count = test.runInfo.count + 1
			if test.before then test.before() end
			local status, exception = pcall(test[fName])
			if status then
				io.write(".")
			else
				test.runInfo.testResults[fName].output = (exception or "").."\n"..debug.traceback()
				io.write("\nF - "..fName.." failed\n")
				print( "Exception: "..(exception or "") )
				print( test.runInfo.testResults[fName].output )
				test.runInfo.fail = test.runInfo.fail + 1
				test.runInfo.testResults[fName].failed = 1
			end
			--print( status, exception )
			if test.after then test.after() end
			collectgarbage("collect")
			test.runInfo.testResults[fName].runTime = os.clock() - testStartTime
		end
	end
	test.runInfo.time = os.clock() - test.startTime
	io.write("\n\n")
	io.write(string.format("Tests: %i  Failed: %i (%0.2f%%)  Elapsed time: %0.3f",
			test.runInfo.count, test.runInfo.fail, (test.runInfo.fail/test.runInfo.count)*100, test.runInfo.time ).."\n\n")
	test.toXML()
	if test.runInfo.fail and test.runInfo.fail > 0 then
		os.exit(test.runInfo.fail)
	end
end
