#!/bin/sh
PATH=$(npm bin):$PATH
BASEDIR=`dirname $0`/../
NPM=$(which npm)
RIMRAF=$(which rimraf)
STANDARD=$(which standard)
WEBPACK=$(which webpack)

run_task () {
    OK="\x1b[32mOK\x1b[0m"
    printf "$1 ..."; $2; printf "\r$1 .. $OK\n"
}

export NODE_ENV=production

if [ "$2" ]
then
  run_task "Install " "$NPM install"
fi

#run_task "Lint    " "$STANDARD"
run_task "Clean   " "$RIMRAF $BASEDIR/project/static"
run_task "Pack    " "$WEBPACK --config $BASEDIR/webpack.prod.config.js"
run_task "Start   " "$NPM start"
