// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "XML",
    products: [
        .library(name: "XML", targets: ["XML"]),
    ],
    dependencies: [
        .package(path: "../Stream"),
        .package(path: "../Test")
    ],
    targets: [
        .target(
            name: "XML",
            dependencies: ["Stream"]),
        .testTarget(
            name: "XMLTests",
            dependencies: ["XML", "Test"]),
    ]
)
