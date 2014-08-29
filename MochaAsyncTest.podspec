Pod::Spec.new do |s|
  s.name             = "MochaAsyncTest"
  s.version          = "0.2.2"
  s.summary          = "Async test using mocha's done style."
  s.homepage         = "https://github.com/azu/MochaAsyncTest"
  s.license          = 'MIT'
  s.author           = {"azu" => "azuciao@gmail.com"}
  s.source           = {:git => "https://github.com/azu/MochaAsyncTest.git", :tag => s.version.to_s}
  s.social_media_url = 'https://twitter.com/azu_re'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.frameworks = 'XCTest'
  s.dependency 'NSRunLoop+PerformBlock'
end
