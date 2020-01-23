// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ditto",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Ditto",
            targets: ["Ditto"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pumperknickle/Regenerate.git", from: "2.0.3"),
    ],
    targets: [
        .target(
            name: "Ditto",
            dependencies: ["Regenerate"]),
        .testTarget(
            name: "DittoTests",
            dependencies: ["Ditto"]),
    ]
)
