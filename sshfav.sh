#!/bin/bash
# sshfav.sh 1.2
# Tim Sheridan <tghs@tghs.net> http://timsheridan.org/
# Chris Frazier <chris@chrisfrazier.me> http://chrisfrazier.me/
# Public domain/copyright-free

# Connect to your favourite SSH locations by making symlinks to this script.
# Filenames should be of the form user@host or user@host:port. A username
# will be prompted for if only a hostname is provided.
# Alternatively, the connection details can be passed as an argument.

set -eu
if [ $# -gt 0 ]; then
	INVOKE_NAME="$1"
else
	INVOKE_NAME=$(basename `echo $0`)
fi

# Extract strings from symlink
SSH_HOST="${INVOKE_NAME#*@}"
SSH_USER="${INVOKE_NAME%@*}"
SSH_PORT="${SSH_HOST#*:}"
SSH_HOST="${SSH_HOST%:*}"
if [ "$SSH_PORT" == "$SSH_HOST" ]; then
    SSH_PORT="22"
fi

# Set remote username to local username if none was provided
while [ "$SSH_USER" == "$SSH_HOST" ] || [ "$SSH_USER" == "" ]; do
    read -p "User: " SSH_USER
done

ssh -p $SSH_PORT $SSH_USER@$SSH_HOST

#eof
