Pod::Spec.new do |s|

  s.name         = "ESGists"
  s.version      = "0.1.4-beta"
  s.summary      = "This module is a small set of Gists API client for EZ-NET CodePiece."

  s.description  = <<-DESC
				   This module is a small set of Gists API client for EZ-NET CodePiece.
				   DESC

  s.homepage     = "https://github.com/EZ-NET/ESGists"

  s.license      = { :type => "MIT", :file => 'LICENSE' }

  s.author             = { "Tomohiro Kumagai" => "http://ez-net.jp/profile/" }
  s.social_media_url   = "http://twitter.com/es_kumagai"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"

  s.source       = { :git => "https://github.com/EZ-NET/ESGists.git", :tag => s.version }
  s.source_files  = "ESGists/**/*.swift"

  s.dependency  'Swim', '~> 1.4.0'
  s.dependency  'Ocean', '~> 1.4.0'
  s.dependency  'ESThread', '~> 0.1.0'
  s.dependency  'ESActiveCounter', '~> 0.1.4'
  s.dependency  'ESCoreGraphicsExtension', '~> 0.1.3'
  s.dependency  'ESNotification', '~> 0.2.0'

  s.dependency  'APIKit', '~> 1.0.0-beta4'
  s.dependency  'Himotoki', '~> 1.0.0'

  s.osx.dependency  'ESAppKitExtension', '~> 0.1.1'

end
