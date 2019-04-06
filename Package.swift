// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "XML",
    products: [
        .library(name: "XML", targets: ["XML"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-foundation/stream.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/test.git",
            .branch("master"))
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
