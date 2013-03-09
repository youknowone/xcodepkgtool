#!/bin/bash

. settings.sh
cd ..

version=`git describe --tags`
version=${version#$tagprefix}
rm build/"$configuration"/*.app/Contents/Info.plist

PROJDIR=`pwd`
cd Pods && xcodebuild -target Pods -configuration "$configuration" # don't think about success
cd "$PROJDIR"

# i am pooooooooooooooor at bash
if [ "$codesign" ]; then
	xcodebuild -target "$target" -configuration "$configuration" &&
	cd "build/$configuration" &&
	productbuild --component "$appname.app" /Applications --sign "$codesign" "$appname $version.pkg"
else
	xcodebuild -target "$target" -configuration "$configuration" &&
	cd "build/$configuration" &&
	productbuild --component "$appname.app" /Applications "$appname $version.pkg"
fi
