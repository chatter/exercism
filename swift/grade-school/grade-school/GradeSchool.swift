//
//  GradeSchool.swift
//  grade-school
//
//  Created by Mitchell Hatter on 2/21/16.
//  Copyright © 2016 Mitchell Hatter. All rights reserved.
//

struct GradeSchool {
  var roster = [Int:[String]]()

  var sortedRoster: [Int:[String]] {
    return roster
  }

  mutating func addStudent(name: String, grade: Int) {
    if roster[grade] != nil {
      roster[grade]?.append(name)
    } else {
      roster.updateValue([name], forKey: grade)
    }
  }

  func studentsInGrade(grade: Int) -> [String] {
    guard roster[grade] != nil else { return [] }
    return roster[grade]!
  }
}
