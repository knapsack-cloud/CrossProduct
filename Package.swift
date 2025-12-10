// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CrossProduct",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CrossProduct",
            targets: ["CrossProduct"]
        ),
    ],
	dependencies: [
		.package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0"),
		.package(
			url: "https://github.com/ph1ps/swift-semantic-version",
			branch: "main",
			traits: [ "StringProcessingBackend" ]
		),
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CrossProduct",
			dependencies: [
				.product(name: "Algorithms", package: "swift-algorithms"),
				.product(name: "SemanticVersion", package: "swift-semantic-version"),
			]
        ),
        .testTarget(
            name: "CrossProductTests",
            dependencies: ["CrossProduct"]
        ),
    ]
)
