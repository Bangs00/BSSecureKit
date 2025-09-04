// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BSSecureKit",
    platforms: [.iOS("13.0")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "BSSecureKit", targets: ["BSSecureKit"]),
        .library(name: "BSSecureKit-Dynamic", type: .dynamic, targets: ["BSSecureKit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BSSecureKit",
            path: "Sources",
            resources: [.copy("PrivacyInfo.xcprivacy")]
        ),
    ]
)
