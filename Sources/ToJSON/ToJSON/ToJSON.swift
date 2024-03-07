// The Swift Programming Language
// https://docs.swift.org/swift-book

@freestanding(expression)
public macro toJSON<T: Encodable>(_ value: T) -> String? = #externalMacro(module: "ToJSONMacros", type: "ToJSONMacro")
