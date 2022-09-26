// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "JavaScriptKit",
    products: [
        .library(name: "JavaScriptKit", targets: ["JavaScriptKit"]),
        .library(name: "JavaScriptEventLoop", targets: ["JavaScriptEventLoop"]),
        .library(name: "JavaScriptBigIntSupport", targets: ["JavaScriptBigIntSupport"]),
        .plugin(name: "TSImporter", targets: ["TSImporter"]),
        .plugin(name: "TSImportCommand", targets: ["TSImportCommand"]),
    ],
    targets: [
        .target(
            name: "JavaScriptKit",
            dependencies: ["_CJavaScriptKit"],
            resources: [.copy("Runtime")]
        ),
        .target(name: "_CJavaScriptKit"),
        .target(
            name: "JavaScriptBigIntSupport",
            dependencies: ["_CJavaScriptBigIntSupport", "JavaScriptKit"]
        ),
        .target(name: "_CJavaScriptBigIntSupport", dependencies: ["_CJavaScriptKit"]),
        .target(
            name: "JavaScriptEventLoop",
            dependencies: ["JavaScriptKit", "_CJavaScriptEventLoop"]
        ),
        .target(name: "_CJavaScriptEventLoop"),

        .plugin(
            name: "TSImporter",
            capability: .buildTool(),
            dependencies: ["ts-importer"]
        ),
        .plugin(
            name: "TSImportCommand",
            capability: .command(
                intent: .custom(
                    verb: "import-ts",
                    description: "Import TypeScript definitions"
                )
            ),
            dependencies: ["ts-importer"]
        ),
        .target(name: "TSInterop"),
        .executableTarget(
            name: "ts-importer",
            dependencies: ["TSInterop"]
        ),
    ]
)
