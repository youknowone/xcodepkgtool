#!/bin/bash

dir=`dirname "$0"`
. "$dir/import_settings.sh"
PROJDIR="$dir/.."

cd $PROJDIR

version=`git describe --tags`
version=${version#$tagprefix}
rm build/"$configuration"/*.app/Contents/Info.plist


BUILDOPT="-scheme ${scheme} -configuration ${configuration}"
if [ "$workspace" ]; then
    BUILDOPT="-workspace ${workspace} $BUILDOPT"
fi

PACKAGEOPT="--component ${appname}.app /Applications"
if [ "$codesign" ]; then
    xcodebuild $BUILDOPT &&
    cd "build/$configuration" &&
    productbuild $PACKAGEOPT --sign ${codesign} "$appname $version.pkg"
else
    xcodebuild $BUILDOPT &&
    cd "build/$configuration" &&
    productbuild $PACKAGEOPT "$appname $version.pkg"
fi

