//
//  jsBuiltInsTests.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/16/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import UIKit
import XCTest

class jsBuiltInsTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testParseInt() {
        XCTAssert(parseInt("20") == 20, "should work on base 10 numbers")
        XCTAssert(parseInt("ü") == nil, "should not work with non-ascii alphanumerics")
        XCTAssert(parseInt("f0c", radix: 16) == 3852, "should work with large radixes")
        XCTAssert(parseInt("z1a1q1", radix: 36) == 2118464569, "should work with very large radixes")
        XCTAssert(parseInt("f0c", radix: 100) == nil, "should not work with radixes > 36")
        XCTAssert(parseInt("10", radix: 0) == nil, "should not work radixes <= 0")
        XCTAssert(parseInt("10", radix: -2) == nil, "should not work radixes <= 0")
    }
}
