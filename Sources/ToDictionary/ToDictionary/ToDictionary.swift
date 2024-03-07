// The Swift Programming Language
// https://docs.swift.org/swift-book


@freestanding(expression)
public macro toDictionary<T: Encodable>(_ value: T) -> [String: Any]? = #externalMacro(module: "ToDictionaryMacros", type: "ToDictionaryMacro")

@freestanding(expression)
public macro toDictionary(_ value: String) -> [String: Any]? = #externalMacro(module: "ToDictionaryMacros", type: "ToDictionaryWithStringMacro")
