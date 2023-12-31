// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NextSwiftUI",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NextSwiftUI",
            targets: ["NextSwiftUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Nuke", from: "12.2.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NextSwiftUI",
            dependencies: [
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "NukeUI", package: "Nuke")
            ],
            resources: [.process("Assets.xcassets")]
        ),
        .testTarget(
            name: "NextSwiftUITests",
            dependencies: ["NextSwiftUI"]),
    ]
)
