/// Encodes an `Encodable` value to JSON and converts it into a `[String: Any]` dictionary.
///
/// 이 매크로는 주로 **로깅/디버깅용** 사용을 권장합니다.
/// 비즈니스 로직에서는 `Encodable` 모델 자체를 사용하는 것을 추천합니다.
@freestanding(expression)
public macro toDictionary<T: Encodable>(_ value: T) -> [String: Any]? = #externalMacro(module: "ToDictionaryMacros", type: "ToDictionaryMacro")

/// Parses a JSON `String` into a `[String: Any]` dictionary.
///
/// 이 매크로 역시 주로 **로깅/디버깅용**으로 사용하기 적합합니다.
@freestanding(expression)
public macro toDictionary(_ value: String) -> [String: Any]? = #externalMacro(module: "ToDictionaryMacros", type: "ToDictionaryWithStringMacro")
