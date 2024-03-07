import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

public struct ToDictionaryWithStringMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
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
