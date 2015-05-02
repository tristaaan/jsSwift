//
//  jsStringTests.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/2/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import XCTest

class jsStringTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLength() {
        // This is an example of a functional test case.
        XCTAssertEqual("hello".length, 5, "Pass")
    }
    
}