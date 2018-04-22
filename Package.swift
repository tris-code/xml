// swift-tools-version:4.2
/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

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
