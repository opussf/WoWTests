echo -n > diff.out

for f in `ls ~/Dev/addons/*/test/wowStubs.lua`;
do
	echo $f >> diff.out
	diff src/wowStubs.lua $f >> diff.out
done
