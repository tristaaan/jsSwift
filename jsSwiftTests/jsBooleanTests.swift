//
//  jsBooleanTests.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/6/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import UIKit
import XCTest

class jsBooleanTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStringBoolean() {
        let truthyString:String = "this is true"
        let falseString:String = ""
        XCTAssert(Bool(str:truthyString), "string should be truthy")
        XCTAssertFalse(Bool(str:falseString), "string should be falsey")
    }
    
    func testIntBoolean() {
        let truthyInt:Int = 20
        let falseyInt:Int = 0
        XCTAssert(Bool(int:truthyInt), "int should be truthy")
        XCTAssertFalse(Bool(int:falseyInt), "int should be falsey")
    }
    
    func testDoubleBoolean() {
        let truthyDouble:Double = 20.0
        let falseyDouble:Double = 0.0
        XCTAssert(Bool(dbl:truthyDouble), "double should be truthy")
        XCTAssertFalse(Bool(dbl:falseyDouble), "double should be falsey")
    }
}