run:
	xcodebuild \
    -workspace App/AheuiSwift.xcodeproj/project.xcworkspace \
    -scheme AheuiSwift \
    -sdk iphonesimulator \
    test | xcpretty -c
