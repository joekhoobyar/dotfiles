#!/bin/sh
#
# openscad
#
# This updates openscad dependencies.
set -e

OS=$(uname -s)
case $OS in
Darwin)
	OS=darwin
	;;
Linux)
	OS=linux
	;;
*)
	echo "Unsupported OS: $OS" >&2 ; exit 1
	;;
esac

printf "\n> openscad update\n"
mkdir -p ~/src/openscad

# libraries
for lib in JustinSDK/dotSCAD@src \
    OskarLinde/scad-utils \
    JohK/nutsnbolts \
    adrianschlatter/threadlib \
    revarbat/BOSL
do
    ghr="${lib%@*}"
    subdir="${lib##*@}"
    printf "\n> openscad lib: $ghr\n"
    wd="$(basename "$ghr")"

    echo git clone "git@github.com:$ghr"
    (cd ~/src/openscad &&
        [ -d "$wd/.git" ] || git clone "git@github.com:$ghr")
done

exit 0
