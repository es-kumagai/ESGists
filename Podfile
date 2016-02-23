source 'https://github.com/EZ-NET/PodSpecs.git'
source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

def pods

	pod 'APIKit', '>= 1.1.2'
	pod 'Himotoki', '>= 1.5.0'
	pod 'Swim', :git => 'https://github.com/EZ-NET/ESSwim', :branch => 'master'
	pod 'Ocean', :git => 'https://github.com/EZ-NET/ESOcean', :branch => 'master'
	pod 'ESThread', '~> 0.1.0'
	pod 'ESActiveCounter', '~> 0.1.4'
	pod 'ESCoreGraphicsExtension', '~> 0.1.3'
	pod 'ESNotification', '~> 0.2.0'

end

def pods_ios

end

def pods_osx

	pod 'ESAppKitExtension', '~> 0.1.1'

end

def pods_test

	pods
	pod 'ESTestKit'

end

target :ESGists_OSX do

	platform :osx, '10.9'

	pods
	pods_osx

end

target :ESGists_iOS do

	platform :ios, '8.0'

	pods
	pods_ios

end

target :ESGists_OSXTests do
	
	platform :osx, '10.10'
	
	pods_osx
	pods_test

end

target :ESGists_iOSTests do
	
	platform :ios, '9.0'

	pods_ios
	pods_test
	
end

target :ESGistsTestApp do
	
	platform :ios, '8.3'
	
	pods
	pods_ios

end
