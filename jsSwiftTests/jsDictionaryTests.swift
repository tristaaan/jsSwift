//
//  jsDictionaryTests.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/4/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import UIKit
import XCTest

class jsDictionaryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testKeys() {
        let dict:Dictionary<String,Int> = ["a":1, "b":2]
        let keysOut = sorted(dict.keys(), <)
        XCTAssertEqual(keysOut, ["a", "b"], "Dictionary.keys() did not come out right")
    }
    
    func testHasOwnProperty() {
        let dict:Dictionary<String,Int> = ["a":1, "b":2]
        XCTAssert(dict.hasOwnProperty("b"), "dict does not have property b")
        XCTAssertFalse(dict.hasOwnProperty("c"), "dict has property c?")
    }
    
    func testToString() {
        let dict:Dictionary<String,Int> = ["a":1, "b":2]
        XCTAssertEqual(dict.toString(), "\(dict)", "Dictionary not converted toString")
    }
}