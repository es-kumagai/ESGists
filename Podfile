source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/EZ-NET/PodSpecs.git'

use_frameworks!

def pods

	pod 'APIKit'
	pod 'Himotoki'
	pod 'ESActiveCounter'
	pod 'ESCoreGraphicsExtension'
	pod 'ESNotification'

end

def pods_ios

	pods

end

def pods_osx

	pods
	pod 'ESAppKitExtension'

end

def pods_test

	pods

end

target :ESGists_OSX do

	platform :osx, '10.9'

	pods_osx

end

target :ESGists_iOS do

	platform :ios, '8.0'

	pods_ios

end

target :ESGists_OSXTests do
	
	platform :osx, '10.9'
	
	pods_osx
	pods_test

end

target :ESGists_iOSTests do
	
	platform :ios, '8.0'

	pods_ios
	pods_test
	
end

target :ESGistsTestApp do
	
	platform :ios, '8.0'
	
	pods
	pods_ios

end
