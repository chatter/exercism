//
//  Leap.swift
//  Leap
//
//  Created by Mitchell Hatter on 2/14/16.
//  Copyright © 2016 Mitchell Hatter. All rights reserved.
//


struct Year {
    let calendarYear: Int
    
    var isLeapYear: Bool {
        return (calendarYear % 4 == 0) && (calendarYear % 100 != 0 || calendarYear % 400 == 0)
    }
}