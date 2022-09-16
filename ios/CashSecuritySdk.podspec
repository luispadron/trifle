#
# Be sure to run `pod lib lint CashSecuritySdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CashSecuritySdk'
  s.version          = '0.1.0'
  s.summary          = 'Security related functions recommended by Cash Security.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Security functionality for interoperability/interaction with core services.
                       DESC

  s.homepage         = 'https://github.com/squareup/cash-security-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author           = { 'Cash Security Engineering' => 'cash-security-triage@squareup.com' }
  s.source           = { :git => 'https://github.com/squareup/cash-security-sdk.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'CashSecuritySdk/Classes/**/*'

  s.swift_versions = '4.0'

  # s.resource_bundles = {
  #   'CashSecuritySdk' => ['CashSecuritySdk/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Tink', '1.5.0'
  s.script_phase = { name: 'Fix Tink for Apple Silicon', script: '"$PODS_TARGET_SRCROOT"/Scripts/FixTinkForAppleSilicon', execution_position: :before_compile }
  s.static_framework = true
  s.preserve_paths = 'Scripts/**/*'

  s.pod_target_xcconfig = {
    'FRAMEWORK_SEARCH_PATHS[sdk=iphonesimulator*][arch=arm64]' => '"$DERIVED_FILE_DIR/apple_silicon" $FRAMEWORK_SEARCH_PATHS',
  }

  s.test_spec 'UnitTests' do |test_spec|
    test_spec.source_files = 'CashSecuritySdk/Tests/**/*'
  end
end
