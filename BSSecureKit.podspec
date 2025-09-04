Pod::Spec.new do |spec|
    spec.name         = "BSSecureKit"
    spec.version      = "1.0.0"
    spec.summary      = "A secure view component for iOS applications"
    spec.description  = <<-DESC
                        BSSecureKit provides secure view components for iOS applications.
                        It includes BSSecureView for UIKit and BSSecureViewRepresentable for SwiftUI.
                        DESC
    spec.homepage     = "https://github.com/Bangs00/BSSecureKit"
    spec.license      = { :type => "MIT", :file => "LICENSE" }
    spec.author       = { "BangsS00" => "gustn9634@gmail.com" }
    spec.platform     = :ios, "13.0"
    spec.source       = { :git => "https://github.com/Bangs00/BSSecureKit.git", :tag => "#{spec.version}" }
    spec.source_files = "Sources/*.swift"
    spec.resource     = "Sources/PrivacyInfo.xcprivacy"
    spec.swift_version = "5.0"
  end