#!/bin/bash
. settings.sh
cd ..

version=`git describe --tags`
version=${version#$tagprefix}

echo $version
