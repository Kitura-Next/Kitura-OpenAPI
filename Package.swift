// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KituraOpenAPI",
    products: [
        .library(
            name: "KituraOpenAPI",
            targets: ["KituraOpenAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Kitura-Next/Kitura.git", from: "2.4.0"),
        .package(url: "https://github.com/Kitura-Next/Swift-cfenv.git", from: "6.0.0"),
        .package(url: "https://github.com/Kitura-Next/LoggerAPI.git", from: "1.7.3"),
    ],
    targets: [
        .target(
            name: "KituraOpenAPI",
            dependencies: ["Kitura", "CloudFoundryEnv", "LoggerAPI"]),
        .testTarget(
            name: "KituraOpenAPITests",
            dependencies: ["KituraOpenAPI", "Kitura"]),
    ]
)
