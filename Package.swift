// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UnitIntervalPropertyWrapper",
    platforms: [
        .iOS(SupportedPlatform.IOSVersion.v13),
        .macOS(SupportedPlatform.MacOSVersion.v10_15),
        .tvOS(SupportedPlatform.TVOSVersion.v13),
        .watchOS(SupportedPlatform.WatchOSVersion.v6),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "UnitIntervalPropertyWrapper",
            targets: [
                "UnitIntervalPropertyWrapper",
            ]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/CypherPoet/ClampedPropertyWrapper",
            .upToNextMinor(from: "0.2.0")
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "UnitIntervalPropertyWrapper",
            dependencies: [
                "ClampedPropertyWrapper",
            ],
            path: "Sources/UnitIntervalPropertyWrapper/"
        ),
        .testTarget(
            name: "UnitIntervalPropertyWrapperTests",
            dependencies: [
                "UnitIntervalPropertyWrapper",
            ],
            path: "Tests/UnitIntervalPropertyWrapper/",
            exclude: [
                "Data/README.md",
                "Toolbox/README.md",
            ]
        ),
    ]
)
