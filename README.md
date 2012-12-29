cut-preserve
============

a patch to allow `cut` to preserve field order

What is it?
-----------

I can't tell you how many times I've written

`echo "a,b,c" | cut -d"," -f2,1 | awk -F, '{printf "%s,%s", $2, $1; print NL}'`

Isn't that `awk` line absurd? All it does is re-order the 2 fields since `cut`
does not respect the given ordering. That's why I patched `cut` to preserve
the given field order when `--preserve-order` is passed.

Installation
------------

`cd /tmp`  
`wget http://ftp.gnu.org/gnu/coreutils/coreutils-8.20.tar.xz`  
`tar xf coreutils-8.20.tar.xz`  
`cd coreutils-8.20/`  
`patch -p0 src/cut.c < cut-preserve.8.20.patch`  
`./configure`  
`make`  

At this point, you should have a working version of `cut` in the `src/`
directory. You can test it by running

`src/cut --help`

to see whether or not the `--preserve-order` option is displayed in the help
text. If so, then you are ready to try it out! I recommend moving it to
somewhere on your PATH like `/usr/local/bin` since you probably don't want to
overwrite `/usr/bin/cut` and you want your patched version to take precedence.

Examples
--------

`echo "a,b,c" | cut -d"," -f1,2,3` > a,b,c

`echo "a,b,c" | cut -d"," -f2,3,1` > a,b,c

`echo "a,b,c" | cut -d"," -f2,3,1 -p` > b,c,a

How to Contribute
=================

* Fork the project on Github.
* Create a topic branch for your changes.
* Ensure that you provide test coverage for your changes.
* Ensure that all tests pass.
* Create a pull request on Github.

TODO
====

* Add ordering support for byte and character selection.
* Add tests.
