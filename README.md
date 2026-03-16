# 매크로 모아놓은 패키지

## ToDictionary
json String 또는 object 를 Dictionary(`[String: Any]`) 로 변경하는 매크로입니다.  
주로 **로깅/디버깅용**으로 사용하는 것을 권장합니다.

### 사용법 
`#toDictionary(value)`

```swift
struct User: Encodable {
    let id: Int
    let name: String
}

let user = User(id: 1, name: "Alice")
let dict: [String: Any]? = #toDictionary(user)
```

## ToJSON
`Encodable` object 를 JSON string 으로 변경하는 매크로  
내부적으로 `JSONEncoder` 를 사용합니다.

### 사용법 
`#toJSON(value)`

```swift
struct User: Encodable {
    let id: Int
    let name: String
}

let user = User(id: 1, name: "Alice")
let json: String? = #toJSON(user)
```
