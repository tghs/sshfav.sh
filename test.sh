#!/bin/bash

# Initialize test framework

TEST_FAILURES=0

test_pass() {
	:
}

test_fail() {
	TEST_FAILURES=`expr $TEST_FAILURES + 1`
}

test_str_eq() {
	if [ "$1" == "$2" ]; then
		test_pass
	else
		test_fail
		echo "Test failed: '$1' == '$2'"
	fi
}

test_str_neq() {
	if [ "$1" != "$2" ]; then
		test_pass
	else
		test_fail
		echo "Test failed: '$1' != '$2'"
	fi
}

# Import test target

. ./sshfav.sh -h &> /dev/null

# Test cases

test_str_eq "`user_from_connection_spec 'example.com'`" ""
test_str_eq "`host_from_connection_spec 'example.com'`" "example.com"
test_str_eq "`port_from_connection_spec 'example.com'`" "22"

test_str_eq "`user_from_connection_spec 'user@example.com'`" "user"
test_str_eq "`host_from_connection_spec 'user@example.com'`" "example.com"
test_str_eq "`port_from_connection_spec 'user@example.com'`" "22"

test_str_eq "`user_from_connection_spec 'example.com:1234'`" ""
test_str_eq "`host_from_connection_spec 'example.com:1234'`" "example.com"
test_str_eq "`port_from_connection_spec 'example.com:1234'`" "1234"

test_str_eq "`user_from_connection_spec 'user@example.com:1234'`" "user"
test_str_eq "`host_from_connection_spec 'user@example.com:1234'`" "example.com"
test_str_eq "`port_from_connection_spec 'user@example.com:1234'`" "1234"

# Test summary
if [ $TEST_FAILURES -eq 0 ]; then
	echo "All tests passed."
else
	exit 1
fi

#eof
