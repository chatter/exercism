struct Hamming {
    static func compute(origin: String, against: String) -> Int? {
        // return quick if strings aren't the same size
        if origin.characters.count != against.characters.count { return nil }
        
        let againstArray = Array(against.characters)
        return origin.characters.enumerate().reduce(0) { (acc: Int, tuple: (index: Int, value: Character)) in
            return acc + (againstArray[tuple.index] == tuple.value ? 0 : 1);
        }
    }
}