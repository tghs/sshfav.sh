#!/bin/bash

# Initialise test framework

test_pass() {
	echo PASS
}

test_fail() {
	echo FAIL
}

test_str_eq() {
	if [ "$1" == "$2" ]; then
		test_pass
	else
		test_fail
	fi
}

test_str_neq() {
	if [ "$1" != "$2" ]; then
		test_pass
	else
		test_fail
	fi
}

# Import test target

. ./sshfav.sh -h &> /dev/null

# Test cases
# TODO

#eof