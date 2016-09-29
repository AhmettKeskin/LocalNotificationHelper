Pod::Spec.new do |s|
  s.name         = 'LocalNotificationHelper'
  s.version      = '2.0'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/AhmettKeskin/LocalNotificationHelper'
  s.authors      = { 'Ahmet Keskin' => 'supreme43tr@gmail.com' }
  s.social_media_url = 'https://twitter.com/_Ahmettkeskin'
  s.summary      = 'Local notification helper for swift'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/AhmettKeskin/LocalNotificationHelper.git', :tag => s.version }
  s.source_files = 'Source/*.{swift}'
  s.framework    = 'SystemConfiguration'
  s.requires_arc = true
end
