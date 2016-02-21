//
//  NucleotideCount.swift
//  nucleotide-count
//
//  Created by Mitchell Hatter on 2/19/16.
//  Copyright © 2016 Mitchell Hatter. All rights reserved.
//

struct DNA {
  let strand: String
  let analysis: [String:Int]

  init?(strand: String) {
    guard (strand.rangeOfString("^[ACGT]*$", options: .RegularExpressionSearch) != nil) else {
      return nil
    }

    self.strand = strand
    self.analysis = DNA.process(self.strand)
  }

  func count(character: String) -> Int {
    return analysis[character]!
  }

  func counts() -> [String:Int] {
    return analysis;
  }

  static func process(s: String) -> [String:Int] {
    return s.characters.reduce(["A": 0, "C": 0, "G": 0, "T": 0]) { (var acc, ele) in
      acc[String(ele)]! += 1
      return acc
    }
  }
}