import Foundation

struct WordCount {
    let words : String
    
    func count() -> [String : Int] {
        return words.lowercaseString
            .withoutPunctuation
            .componentsSeparatedByString(" ")
            .filter({!$0.isEmpty})
            .reduce([String:Int](), combine: { (var acc, ele) in
                acc.updateValueWithInitial(ele, initial: 1) { $0[$1]! + 1 }
                return acc
            })
    }
}

extension String {
    var withoutPunctuation: String {
        let characterSet = NSMutableCharacterSet(charactersInString: "$^")
        characterSet.formUnionWithCharacterSet(.punctuationCharacterSet())
        
        return self.componentsSeparatedByCharactersInSet(characterSet).joinWithSeparator("")
    }
}

extension Dictionary {
    /**
     * Updates the key in map with the given function.
     * If the key does not exist, inserts the given initial value.
     */
    mutating func updateValueWithInitial(key: Key, initial: Value, fun: (map: Dictionary<Key, Value>, key: Key) -> Value) -> Value? {
        if let _ = self[key] {
            self[key] = fun(map: self, key: key)
        } else {
            self[key] = initial
        }
        
        return self[key]
    }
}