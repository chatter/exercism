//
//  Anagram.swift
//  anagram
//
//  Created by Mitchell Hatter on 2/19/16.
//  Copyright © 2016 Mitchell Hatter. All rights reserved.
//

struct Anagram {
  let word: String

  init(word: String) {
    self.word = word
  }

  func match(words: [String]) -> [String] {
    let anagrams = words.filter { w in
      // return early if w and original word are equal
      if w.lowercaseString == word.lowercaseString {
        return false
      }

      // create mutable array of original word characters
      var chars = Array(word.lowercaseString.characters)

      // loop over each character in w, if it exists in chars remove it;
      // otherwise return false as this can't be an anagram
      for c in w.lowercaseString.characters {
        guard let i = chars.indexOf(c) else { return false }
        chars.removeAtIndex(i)
      }

      // chars should not have any characters left
      return chars.count == 0
    }

    return anagrams
  }
}
