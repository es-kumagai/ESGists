Pod::Spec.new do |s|

  s.name         = "ESGists"
  s.version      = "0.2.1"
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

  s.dependency  'Ocean', '~> 1.5.0'

  s.dependency  'APIKit', '~> 1.3.0'
  s.dependency  'Himotoki', '~> 1.7.0'

  s.osx.dependency  'ESAppKitExtension', '~> 0.1.2'

end
