import Foundation
import PackagePlugin

@main
struct TSImporterPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let executablePath = try context.tool(named: "ts-importer").path

        let outputPath = context.pluginWorkDirectory.appending(subpath: "_TSImported.swift")

        return [
            .buildCommand(
                displayName: "Importing TypeScript definitions",
                executable: executablePath,
                arguments: [
                    target.directory,
                    outputPath.string,
                ],
                outputFiles: [
                    outputPath,
                ]
            ),
        ]
    }
}
