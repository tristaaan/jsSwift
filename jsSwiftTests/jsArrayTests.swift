//
//  jsSwiftTests.swift
//  jsSwiftTests
//
//  Created by Tristan Wright on 5/2/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import UIKit
import XCTest

class jsArrayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEvery() {
        let a = [1,2,3,4]
        XCTAssertFalse(a.every({(el)->Bool in
            return el > 2
        }), "every element in \(a) is greater than 2!?")
        
        XCTAssert(a.every({(el)->Bool in
            return el >= 1
        }), "every element in \(a) is greater than or equal to 1!?")
    }
    
    func testSome() {
        let a = [1,2,3,4]
        XCTAssertFalse(a.some({(el)->Bool in
            return el > 4
        }), "some elements in \(a) than 4!?")
        
        XCTAssert(a.some({(el)->Bool in
            return el > 2
        }), "no elements in \(a) are greater than 2!?")
    }
    
    func testLength() {
        let a:Array<Int> = [1,2,3]
        XCTAssert(a.length == 3, "length failing")
    }
    
    func testConcat() {
        // This is an example of a functional test case.
        let a:Array<Int> = [1,2]
        let b:Array<Int> = [3,4]
        XCTAssertEqual(a.concat(b), [1,2,3,4], "concat fails")
    }
    
    func testPush() {
        let newEl:String = "Boats"
        var a:Array<String> = ["Cars", "Planes", "Trains"]
        XCTAssert(a.push(newEl) == 4, "push returns the incorrect new length")
        XCTAssertEqual(a, ["Cars", "Planes", "Trains", "Boats"], "item \(newEl), not pushed to end of array \(a)")
    }
    
    func testPop(){
        var a:Array<String> = ["Cars", "Planes", "Trains", "Boats"]
        XCTAssert(a.pop() == "Boats", "last item not popped")
        XCTAssertEqual(a, ["Cars", "Planes", "Trains"], "pop incorrectly altered array")
    }
    
    func testUnshift(){
        let newEl:String = "Boats"
        var a:Array<String> = ["Cars", "Planes", "Trains"]
        XCTAssert(a.unshift(newEl) == 4, "unshift returns the incorrect new length")
        XCTAssertEqual(a, ["Boats", "Cars", "Planes", "Trains"], "item \(newEl), not pushed to front of array \(a)")
    }
    
    func testShift() {
        var a:Array<String> = ["Boats", "Cars", "Planes", "Trains"]
        XCTAssert(a.shift() == "Boats", "first item not shifted")
        XCTAssertEqual(a, ["Cars", "Planes", "Trains"], "shift incorrectly altered the array")
    }
}
