#!/bin/sh
cd $(dirname $0)

cd ../webapp

gradle build -g gradle-user-home
ret=$?
if [ $ret -ne 0 ]; then
exit $ret
fi
rm -rf build
