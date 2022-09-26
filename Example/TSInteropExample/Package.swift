// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "TSInteropExample",
    dependencies: [.package(name: "JavaScriptKit", path: "../../")],
    targets: [
        .executableTarget(
            name: "TSInteropExample",
            dependencies: [
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
            ],
            plugins: [
                .plugin(name: "TSImporter", package: "JavaScriptKit"),
            ]
        ),
    ]
)
