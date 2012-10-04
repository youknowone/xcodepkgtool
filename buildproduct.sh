#!/bin/bash

. settings.sh

version=`git describe --tags`
version=${version#$tagprefix}
rm ../build/Release/*.app/Contents/Info.plist
cd ..

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
