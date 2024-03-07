// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "CommonMacros",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "ToDictionary",
            targets: ["ToDictionary"]
        ),
        .executable(
            name: "ToDictionaryClient",
            targets: ["ToDictionaryClient"]
        ),
        .library(
            name: "ToJSON",
            targets: ["ToJSON"]
        ),
        .executable(
            name: "ToJSONClient",
            targets: ["ToJSONClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    ],
    targets: [
        .macro(
            name: "ToDictionaryMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ],
            path: "Sources/ToDictionary/ToDictionaryMacros"
        ),
        .target(
            name: "ToDictionary",
            dependencies: ["ToDictionaryMacros"],
            path: "Sources/ToDictionary/ToDictionary"
        ),
        .executableTarget(
            name: "ToDictionaryClient",
            dependencies: ["ToDictionary"],
            path: "Sources/ToDictionary/ToDictionaryClient"
        ),
        .macro(
            name: "ToJSONMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ],
            path: "Sources/ToJSON/ToJSONMacros"
        ),
        .target(
            name: "ToJSON",
            dependencies: ["ToJSONMacros"],
            path: "Sources/ToJSON/ToJSON"
        ),
        .executableTarget(
            name: "ToJSONClient",
            dependencies: ["ToJSON"],
            path: "Sources/ToJSON/ToJSONClient"
        ),
        .testTarget(
            name: "ToDictionaryTests",
            dependencies: [
                "ToDictionary",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ],
            path: "Sources/ToDictionary/ToDictionaryTests"
        ),
        .testTarget(
            name: "ToJSONTests",
            dependencies: [
                "ToJSON",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ],
            path: "Sources/ToJSON/ToJSONTests"
        ),
    ]
)
