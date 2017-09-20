//
//  jsStringTests.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/2/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import UIKit
import XCTest

class jsStringTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLength() {
        XCTAssertEqual("hello".length, 5, "string length incorrect")
    }
    
    func testSubstring() {
        let str:String = "hello"
        XCTAssert(str.substr(0) == "hello", "fails with 1 argument: \(str.substr(0))")
        XCTAssert(str.substring(2) == "llo", "fails with 1 argument: \(str.substring(2))")
        
        XCTAssert(str.substr(0, end: 2) == "he", "expected \"he\" got \(str.substr(0,end: 2))")
        XCTAssert(str.substring(0, end: 2) == "he", "expected \"he\" got \(str.substring(0, end:2))")
        
        XCTAssert(str.substr(0, end: 10) == str, "fails when end > str.length")
        XCTAssert(str.substring(0, end: 10) == str, "fails when end > str.length")
        
        XCTAssert(str.substring(5, end: 2) == "", "substring fails when start > end")
    }
    
    func testIndexOf() {
        let str:String = "justice"
        let tok:String = "s"
        XCTAssert(str.indexOf("z") == -1, "z in \(str)")
        XCTAssert(str.indexOf(tok) == 2, "indexOf returns wrong index of character: \(str), expected: s, got: \(str.indexOf(tok))")
        XCTAssert(str.indexOf(tok, start: 3) == -1, "indexOf returns wrong value when start defined")
        XCTAssert(str.indexOf(tok, start: 20) == -1, "indexOf returns wrong value when start > str.length")
    }
    
    func testSplit() {
        let str:String = "razzmatazz"
        XCTAssertEqual(str.split("zz"), ["ra", "mata", ""], "string split incorrectly")
    }
    
    func testTrim() {
        var str:String = "  hello \n"
        str.trim()
        XCTAssert( str == "hello", "string trimmed incorrectly, \"\(str)\"")
    }
    
    func testCharAt() {
        let str:String = "liberty"
        XCTAssert(str.charAt(0) == Character("l"), "wrong character grabbed with charAt(int)")
        XCTAssert(str[0] == Character("l"), "wrong character grabbed with str[int]")
        
        XCTAssert(str.charAt(str.characters.count-1) == Character("y"), "wrong character grabbed with str.charAt(str.length-1)")
        XCTAssert(str[str.characters.count-1] == Character("y"), "wrong character grabbed with str[str.length-1]")
        
        XCTAssert(str.charAt(-1) == nil, "wrong character grabbed with charAt(-1)")
        XCTAssert(str[-1] == nil, "wrong character grabbed with str[-1]")
        
        XCTAssert(str.charAt(20) == nil, "wrong character grabbed with charAt(20)")
        XCTAssert(str[20] == nil, "wrong character grabbed with str[20]")
    }
    
    func testToUpperCase() {
        let str:String = "freedom"
        XCTAssert(str.toUpperCase() == str.uppercased(), "uppercase is wrong: \(str) -> \(str.toUpperCase())")
    }
    
    func testToLowerCase() {
        let str:String = "BRAVERY"
        XCTAssert(str.toLowerCase() == str.lowercased(), "lowercase is wrong: \(str) -> \(str.toLowerCase())")
    }
}
