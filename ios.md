
Crash Logs
~/Library/Logs/DiagnosticReports/

## About iOS Dynamic or Static library / framework
- https://www.raywenderlich.com/2658-creating-a-static-library-in-ios-tutorial
- https://www.raywenderlich.com/2430-how-to-create-a-framework-for-ios
- https://www.ca.com/en/blog-developers/dynamic-versus-static-framework-in-ios.html
- https://pewpewthespells.com/blog/convert_static_to_dynamic.html
- https://allegro.tech/2018/05/Static-linking-vs-dyld3.html
  - https://gist.github.com/kam800/0d04917b4f051c1dd906d629d685f571
  - https://github.com/aliceatlas/buildstatic
- https://www.bignerdranch.com/blog/it-looks-like-you-are-trying-to-use-a-framework/

## Add Framework via Carthage in Xcode
Prerequisites: Install Carthage and Cartfile created
1. [Code or Text Editor] Add framework dependency entry would like to add to Cartfile, and save it. For example: github "Alamofire/AlamofireImage"
2. [Terminal] Run `carthage update --no-use-binaries --cache-builds --platform iOS`
3. [Xcode] XCode > Build phases
- Plus button on top left > New Run Script Phases
- Run Script > Shell script window > add following: `/usr/local/bin/carthage copy-frameworks`
- Run Script > Input file window > add following: `$(SRCROOT)/Carthage/Build/iOS/DependencyName.framework`
4. [Xcode] Link Binary With Libraries > Plus button > Add Other > Navigate to Project Folder > Carthage > Build > iOS > Framework to add
![](https://i.stack.imgur.com/pH1Rp.png)
