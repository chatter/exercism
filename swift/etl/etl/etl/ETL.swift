//
//  ETL.swift
//  etl
//
//  Created by Mitchell Hatter on 2/16/16.
//  Copyright © 2016 Mitchell Hatter. All rights reserved.
//

struct ETL {
    static func transform(old: [Int:[String]]) -> [String : Int] {
        return old.reduce([String : Int]()) { (acc, ele: (key: Int, value: [String])) in
            return ele.value.reduce(acc) { (var a, s) in
                a[s.lowercaseString] = ele.key
                return a
            }
        }
    }
}
