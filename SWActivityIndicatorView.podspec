#
# Be sure to run `pod lib lint SWActivityIndicatorView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SWActivityIndicatorView"
  s.version          = "2.0.0"
  s.summary          = "A simple flat activity indicator view."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
#  s.description      = <<-DESC
#                       DESC

  s.homepage         = "https://github.com/sarunw/SWActivityIndicatorView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Sarun Wongpatcharapakorn" => "artwork.th@gmail.com" }
  s.source           = { :git => "https://github.com/sarunw/SWActivityIndicatorView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/sarunw'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
#s.resource_bundles = {
#   'SWActivityIndicatorView' => ['Pod/Assets/*.png']
# }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
