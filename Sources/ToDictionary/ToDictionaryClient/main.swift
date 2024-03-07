import ToDictionary
import Foundation

struct Test: Codable {
    let name: String
    let id: Int
}

let test = Test(name: "test", id: 0)

let dic = #toDictionary(test)

let test2 = "{\"City\":\"Paris\"}"
let dic2 = #toDictionary(test2)

print(dic)
let test3 = "123"
let dic3 = #toDictionary(test3)
