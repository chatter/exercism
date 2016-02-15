struct Hamming {
    static func compute(origin: String, against: String) -> Int? {
        // return quick if strings aren't the same size
        guard origin.characters.count == against.characters.count else { return nil }

        return zip(origin.characters, against.characters).reduce(0) { (acc: Int, tuple: (a: Character, b: Character)) in
            return acc + (tuple.a == tuple.b ? 0 : 1)
        }
    }
}