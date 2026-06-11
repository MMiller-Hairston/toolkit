// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Toolkit",
    platforms: [
        .macOS(.v26)
    ],
    products: [
        .library(name: "Explorer", targets: ["Explorer"]),
        .executable(name: "Toolkit", targets: ["Toolkit"]),
    ],
    targets: [
        .target(
            name: "Explorer",
            path: "src/Explorer",
            cxxSettings: [
                .unsafeFlags(["-std=c++26"])
            ]
        ),
        .executableTarget(
            name: "Toolkit",
            dependencies: ["Explorer"],
            path: "src/Toolkit",
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
        .testTarget(
            name: "ToolkitTests",
            dependencies: ["Toolkit"],
            path: "tests/ToolkitTests",
            swiftSettings: [
                .unsafeFlags(["-strict-concurrency=complete"])
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
