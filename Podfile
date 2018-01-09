source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

project 'LayoutFrameworkBenchmark.xcodeproj'

platform :ios, '10.0'

inhibit_all_warnings!

target 'LayoutFrameworkBenchmark' do
  pod 'FlexLayout'
	pod 'LayoutKit'
  pod 'PinLayout'
  pod 'Reveal-SDK'

  swift_32 = ['FlexLayout', 'PinLayout', 'Reveal-SDK']
  swift4 = ['LayoutKit']

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      swift_version = nil

      if swift_32.include?(target.name)
        swift_version = '3.2'
      end

      if swift4.include?(target.name)
        swift_version = '4.0'
      end

      if swift_version
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = swift_version
        end
      end
    end
end
end

