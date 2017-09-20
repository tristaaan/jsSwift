//
//  jsDateTests.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/4/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import UIKit
import XCTest

class jsDateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNow() {
        XCTAssert(Date.now() == NSTimeIntervalSince1970, "incorrect time since 1970")
    }
    
    func testGetters() {
        let date:Date = Date(year: 2007, month: 1, day: 8, hour: 9, minute: 43, seconds: 24)
        XCTAssert(date.getFullYear()  == 2007, "year getter wrong: \(date.getFullYear())")
        XCTAssert(date.getMonth() == 1,    "month getter wrong: \(date.getMonth())")
        XCTAssert(date.getDate()   == 8,   "date getter wrong: \(date.getDate())")
        XCTAssert(date.getDay()   == 2,   "day getter wrong: \(date.getDay())") // was a Monday
        XCTAssert(date.getHours() == 9,    "hours getter wrong: \(date.getHours())")
        XCTAssert(date.getMinutes() == 43, "minutes getter wrong: \(date.getMinutes())")
        XCTAssert(date.getSeconds() == 24, "seconds getter wrong: \(date.getSeconds())")
    }
    
    func testToString(){
        let date:Date = Date(year: 1984, month: 1, day: 24, hour: 0, minute: 0, seconds: 0)
        XCTAssert(date.toString() == date.description,    "toString")
    }
    
    func testToDateString() {
        let date:Date = Date(year: 2014, month: 6, day: 2, hour: 11, minute: 45, seconds: 0)
        XCTAssert(date.toDateString() == "Monday, June 2, 2014", "Date string wrong")
    }
    
    func testToTimeString() {
        let date:Date = Date(year: 2014, month: 6, day: 2, hour: 11, minute: 45, seconds: 0)
        XCTAssert(date.toTimeString().components(separatedBy: CharacterSet.whitespaces)[0] == "11:45:00", "Time string wrong")
    }
}
