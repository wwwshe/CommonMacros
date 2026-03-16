import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics
import Foundation

private struct ToJSONMacroArgumentMissingMessage: SwiftDiagnostics.DiagnosticMessage {
    let message: String = "toJSON macro requires at least one argument"
    let diagnosticID: SwiftDiagnostics.MessageID = .init(domain: "ToJSONMacro", id: "missingArgument")
    let severity: SwiftDiagnostics.DiagnosticSeverity = .error
}

public struct ToJSONMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            context.diagnose(.init(node: Syntax(node), message: ToJSONMacroArgumentMissingMessage()))
            return "nil"
        }
        return """
          {
              let encoder = JSONEncoder()
              guard let jsonData = try? encoder.encode(\(raw: argument.description)) else {
                  return nil
              }
              return String(bytes: jsonData, encoding: String.Encoding.utf8)
          }()
        """
    }
}

@main
struct ToJSONPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ToJSONMacro.self,
    ]
}
