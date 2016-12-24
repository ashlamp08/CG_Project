#!/bin/sh
print_usage()
{
	echo Usage: "runAndBlend[.sh] EXECUTABLE INPUT_FILE [OUTPUTFILE]"
	echo "If OUTPUTFILE is not specified it will create file \"output.txt\" in the current Directory"
}

if [ $# -ne 2 ] && [ $# -ne 3 ]
then
	echo ERROR: Wrong number of arguments
	print_usage
	exit 1
fi

if ! [ -f "$1" ]
then
	echo 'ERROR: "'$1'"' "doesn't exits"
	exit 1
fi

if ! [ -f "$2" ]
then
	echo 'ERROR: "'$1'"' "doesn't exits"
	exit 1
fi

if [ $# -eq 2 ]
then
	executable="$(dirname $1)/$(basename $1)"
	inputFile="$(dirname $2)/$(basename $2)"
	outputFile="output.txt"
fi

if [ $# -eq 3 ]
then
	executable="$(dirname $1)/$(basename $1)"
	inputFile="$(dirname $2)/$(basename $2)"
	outputFile="$(dirname $3)/$(basename $3)"
fi

$executable $inputFile $outputFile
if [ $? -ne 0 ]
then
	echo Program Failed
	exit 1
fi
/home/ashok/blender-2.78a-linux-glibc211-x86_64/blender ../visualize.blend -P ../test.py
