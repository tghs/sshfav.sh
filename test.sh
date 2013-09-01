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

#eof
