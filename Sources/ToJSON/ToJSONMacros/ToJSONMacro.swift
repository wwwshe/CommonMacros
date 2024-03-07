import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct ToJSONMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }
        return """
          {
              guard let jsonData = try? JSONSerialization.data(withJSONObject: \(raw: argument.description), options: []) else {
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
