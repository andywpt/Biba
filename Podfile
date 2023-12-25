# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

target 'Biba' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # ignore warnings from pods
  inhibit_all_warnings!
  # Pods for Biba
  pod 'Firebase/RemoteConfig'
  pod 'FirebaseAppCheck'
  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'
  pod 'FirebaseFirestoreSwift'
  pod 'FirebaseFunctions'
  pod 'FirebaseInAppMessaging', "> 10.7-beta"
  pod 'FirebaseMessaging'
  pod 'GoogleMLKit/BarcodeScanning'
  pod 'GoogleSignIn'
  pod 'LineSDKSwift'
  pod 'Mobile-Buy-SDK'
  pod 'SDWebImage'
  pod 'SkeletonView'
  pod 'SnapKit'
  pod 'Sourcery'
  pod 'SwipeCellKit'
  pod 'Parchment', '~> 3.2'
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
