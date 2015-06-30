#
# Be sure to run `pod lib lint ZLCommonMethod.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ZLCommonMethod"
  s.version          = "0.1.0"
  s.summary          = "Common method for us to use in iOS projects."
  s.description      = "When we create a new project, we could use cocoapods to add all the useful files we collect to help us develop our new product"
  s.homepage         = "https://github.com/ZhuShouyu/ZLCommonMethod"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Siam" => "shouyuzhu@hotmail.com" }
  s.source           = { :git => "https://github.com/ZhuShouyu/ZLCommonMethod.git", :tag => s.version }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ZLCommonMethod' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'MBProgressHUD', '~> 0.9.1'
end
