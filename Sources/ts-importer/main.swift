import Foundation

let outputFile = CommandLine.arguments[1]

try "// GENERATED BY TSImporter. DO NOT EDIT!".write(to: URL(fileURLWithPath: outputFile), atomically: true, encoding: .utf8)
