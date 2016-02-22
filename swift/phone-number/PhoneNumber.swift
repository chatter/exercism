//
//  PhoneNumber.swift
//  phone-number
//
//  Created by Mitchell Hatter on 2/21/16.
//  Copyright © 2016 Mitchell Hatter. All rights reserved.
//

struct PhoneNumber : CustomStringConvertible {
  let number: String

  var areaCode: String {
    return number[number.startIndex...number.startIndex.advancedBy(2)]
  }

  var description: String {
    let co = self.number[number.startIndex.advancedBy(3)...number.startIndex.advancedBy(5)]
    let te = self.number[number.startIndex.advancedBy(6)..<number.endIndex]

    return "(\(self.areaCode)) \(co)-\(te)"
  }

  init(_ number: String) {
    self.number = PhoneNumber.format(number)
  }

  private static func format(number: String) -> String {
    var c = number.characters.filter {
      return !["(", ")", "-", " ", "."].contains($0)
    }

    guard c.count >= 10 else { return "0000000000" }

    if c.count > 10 {
      guard c.first == "1" else { return "0000000000" }
      c.removeFirst()
    }

    return String(c)
  }
}
