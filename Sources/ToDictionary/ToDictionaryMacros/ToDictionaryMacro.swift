import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

public struct ToDictionaryMacro: ExpressionMacro {
    
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }
        return objectToDictionary(argument: argument)
    }
    
    public static func objectToDictionary(argument: ExprSyntax) -> ExprSyntax {
        return """
          {
              guard let data = try? JSONEncoder().encode(\(raw: argument.description)) else {
                    return nil
              }
              let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
              return dictionary
          }()
        """
    }
}

@main
struct ToDictionaryPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ToDictionaryMacro.self,
        ToDictionaryWithStringMacro.self
    ]
}
