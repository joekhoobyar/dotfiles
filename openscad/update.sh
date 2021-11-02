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

printf "\n> openscad environment\n"
mkdir -p ~/Library/LaunchAgents
cat >~/Library/LaunchAgents/env-openscad.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>my.startup</string>
  <key>ProgramArguments</key>
  <array>
    <string>sh</string>
    <string>-c</string>
    <string>
    launchctl setenv OPENSCADPATH $HOME/src/openscad/lib
    </string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
EOF
launchctl load ~/Library/LaunchAgents/env-openscad.plist

printf "\n> openscad libraries\n"
mkdir -p ~/src/openscad

OPENSCAD_LIBS=( \
    JustinSDK/dotSCAD@src \
    OskarLinde/scad-utils \
    JohK/nutsnbolts \
    adrianschlatter/threadlib \
    revarbat/BOSL \
    jreinhardt/local-scad \
)

# libraries
for lib in "${OPENSCAD_LIBS[@]}"
do
    ghr="${lib%@*}"
    subdir="${lib##*@}"
    printf "\n> openscad lib: $ghr\n"
    wd="$(basename "$ghr")"

    echo git clone "git@github.com:$ghr"
    if [ "$ghr" == "$lib" ]; then
        (cd ~/src/openscad/lib &&
            [ -d "$wd/.git" ] || git clone "git@github.com:$ghr")
    else
        (cd ~/src/openscad/share &&
            [ -d "$wd/.git" ] || git clone "git@github.com:$ghr")

        echo ln -nsf "../share/$wd/$subdir" "~/src/openscad/lib/$wd"
    fi
done

exit 0
    fi
done

exit 0
