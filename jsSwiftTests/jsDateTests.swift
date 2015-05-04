//
//  jsDateTests.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/4/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import XCTest

class jsDateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNow() {
        XCTAssert(NSDate(year:1970).now() == NSTimeIntervalSince1970, "incorrect time since 1970")
    }
    
    func testGetters(){
        let date:NSDate = NSDate(year: 2007, month: 6, day: 29, hour: 9, minute: 43, seconds: 24)
        XCTAssert(date.getYear()  == 2007, "year getter wrong")
        XCTAssert(date.getMonth() == 6,    "month getter wrong")
        XCTAssert(date.getDay()   == 29,   "day getter wrong")
        XCTAssert(date.getHours() == 9,    "hours getter wrong")
        XCTAssert(date.getMinutes() == 43, "minutes getter wrong")
        XCTAssert(date.getSeconds() == 24, "seconds getter wrong")
    }
}