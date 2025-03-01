#
# Be sure to run `pod lib lint EZLinksSDKPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EZLinksSDK'
  s.version          = '1.0.0'
  s.summary          = 'An awesome SDK for EZLinks integration.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'EZLinksSDK provides seamless integration with EZLinks, offering APIs for booking, scheduling, and managing golf services with ease.'
  s.homepage         = 'https://github.com/rup2701/EZLinksSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ezlinks' => 'rupesh@getezlinks.io' }
  s.source           = { :git => 'https://github.com/GetEZLinks/EZLinksSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'Classes/**/*'
  
  # s.resource_bundles = {
  #   'EZLinksSDK' => ['Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire', '~> 5.6'
  s.swift_versions   = ['5.0']
end
