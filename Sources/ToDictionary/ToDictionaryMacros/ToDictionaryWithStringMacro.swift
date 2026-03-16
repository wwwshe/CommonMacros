import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics
import Foundation

private struct ToDictionaryWithStringMacroArgumentMissingMessage: SwiftDiagnostics.DiagnosticMessage {
    let message: String = "toDictionary(String) macro requires at least one argument"
    let diagnosticID: SwiftDiagnostics.MessageID = .init(domain: "ToDictionaryWithStringMacro", id: "missingArgument")
    let severity: SwiftDiagnostics.DiagnosticSeverity = .error
}

public struct ToDictionaryWithStringMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            context.diagnose(.init(node: Syntax(node), message: ToDictionaryWithStringMacroArgumentMissingMessage()))
            return "nil"
        }
        return jsonToDictionary(argument: argument)
    }
    
    public static func jsonToDictionary(argument: ExprSyntax) -> ExprSyntax {
        return """
          {
              guard let data = \(raw: argument.description).data(using: .utf8) else {
                    return nil
              }
              let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
              return dictionary
          }()
        """
    }
}
