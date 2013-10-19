# sshfav.sh

[sshfav.sh project page](http://timsheridan.org/project/sshfav.sh)

A shell script for connecting to your favourite SSH locations easily.

## Usage

Make symlinks to sshfav.sh using filenames of the form '[user@]host[:port]' and execute them. If a username is omitted, you will be prompted for a user each time you run it. If no port is specified, port 22 will be used.

If the symlink is installed into your PATH, then you'll be able to use it by executing it in a shell:

```
$ root@example.com
Password:
# 
```

## Mac OS X

If you want to be able to launch these SSH favourites from Mac OS X's GUI, the way that the Finder resolves symbolic and hard links means that you have to either have multiple copies of sshfav.sh or use a wrapper script which you duplicate for each of your SSH connections. This wrapper script looks like this (if you've put sshfav.sh in your PATH):

```
#!/bin/sh
sshfav.sh `basename $0`
```

Name the wrapper script file using the 'user@host' pattern, chmod +x it and set it to open in Termainal.app (it's under 'Get Info' for the file). Afterwards, just copying an SSH favourite and renaming it will work perfectly.

I keep all of mine in a directory that I have in my Dock.

![Screenshot of SSH bookmarks in the Dock on Mac OS X](http://timsheridan.org/asset/image/sshfav_osx.png)
