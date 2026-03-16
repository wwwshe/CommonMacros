/// Encodes an `Encodable` value to a JSON `String`.
///
/// - Returns: A UTF-8 JSON string if encoding succeeds, otherwise `nil`.
@freestanding(expression)
public macro toJSON<T: Encodable>(_ value: T) -> String? = #externalMacro(module: "ToJSONMacros", type: "ToJSONMacro")
