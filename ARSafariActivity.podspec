Pod::Spec.new do |s|
  s.name						 = 'ARSafariActivity'
  s.version					 = '1.0.4'
  s.license					 = 'MIT'
  s.summary					 = 'A UIActivity subclass that opens URLs in Safari.'
  s.homepage				 = 'https://github.com/alexruperez/ARSafariActivity'
	s.screenshots			 = "https://raw.githubusercontent.com/alexruperez/ARSafariActivity/master/screenshot.png"
  s.author					 = { "alexruperez" => "contact@alexruperez.com" }
	s.social_media_url = 'https://twitter.com/alexruperez'
  s.platform				 = :ios, '6.0'
	s.license					 = 'MIT'
  s.source					 = { :git => 'https://github.com/alexruperez/ARSafariActivity.git', :tag => s.version.to_s }
  s.source_files		 = 'ARSafariActivity/*.{h,m}'
  s.resources				 = 'ARSafariActivity/ARSafariActivity.bundle'
  s.requires_arc		 = true
	s.frameworks			 = 'UIKit'
end
