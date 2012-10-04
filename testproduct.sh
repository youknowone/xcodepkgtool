#!/bin/bash

. settings.sh

version=`git describe --tags`
version=${version#$tagprefix}
installer -pkg "../build/Release/$appname $version.pkg" -target '/'