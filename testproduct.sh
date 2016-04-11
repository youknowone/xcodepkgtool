#!/bin/bash

dir=`dirname "$0"`
. "$dir/import_settings.sh"
cd "$dir/.."

version=`git describe --tags`
version=${version#$tagprefix}
installer -pkg "build/Release/$appname $version.pkg" -target '/'