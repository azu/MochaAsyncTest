Pod::Spec.new do |s|
  s.name        = "MochaAsyncTest"
  s.version     = "0.1.0"
  s.summary     = "A short description of MochaAsyncTest."
  s.description = <<-DESC
                       An optional longer description of MochaAsyncTest

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
  DESC
  s.homepage     = "https://github.com/azu/MochaAsyncTest"
  s.license      = 'MIT'
  s.author       = {"azu" => "azuciao@gmail.com"}
  s.source       = {:git => "https://github.com/azu/MochaAsyncTest.git", :tag => s.version.to_s}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.frameworks = 'XCTest'
  s.dependency 'NSRunLoop+PerformBlock'
end
