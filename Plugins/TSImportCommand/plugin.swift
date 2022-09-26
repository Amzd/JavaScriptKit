import Foundation
import PackagePlugin

@main struct TSImportCommand: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) throws {
        let tsImporter = try context.tool(named: "ts-importer").path
        var parsed = ArgumentExtractor(arguments)
        let targetNames = parsed.extractOption(named: "target")
        let targets = try context.package.targets(named: targetNames)
        for target in targets {
            let importedSwift = target.directory.appending("TSImported.swift")
            try Process.run(URL(fileURLWithPath: tsImporter.string), arguments: [
                importedSwift.string
            ])
        }
    }
}
