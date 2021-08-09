#!/bin/bash

echo !!!!Your Universal DI Framework Is Getting Ready!!!!

xcodebuild archive \
-scheme DILib \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './Build/DILib.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES


xcodebuild archive \
-scheme DILib \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './Build/DILib.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES


xcodebuild archive \
-scheme DILib \
-configuration Release \
-destination 'platform=macOS,arch=x86_64,variant=Mac Catalyst' \
-archivePath './Build/DILib.framework-catalyst.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework './build/DILib.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/DILib.framework' \
-framework './build/DILib.framework-iphoneos.xcarchive/Products/Library/Frameworks/DILib.framework' \
-framework './build/DILib.framework-catalyst.xcarchive/Products/Library/Frameworks/DILib.framework' \
-output './Build/DILib.xcframework'

cd Build
   rm -rf DILib.framework-iphoneos.xcarchive
      rm -rf DILib.framework-catalyst.xcarchive
         rm -rf DILib.framework-iphonesimulator.xcarchive

echo !!!!Your Universal DI Framework Is Ready Now!!!!
