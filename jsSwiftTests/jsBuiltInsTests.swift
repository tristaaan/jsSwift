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
        XCTAssert(parseInt("20f", radix: 10) == nil, "should not work if radix is not right")
        XCTAssert(parseInt("f0c", radix: 16) == 3852, "should work with large radixes")
        XCTAssert(parseInt("z1a1q1", radix: 36) == 2118464569, "should work with very large radixes")
        XCTAssert(parseInt("f0c", radix: 100) == nil, "should not work with radixes > 36")
        XCTAssert(parseInt("10", radix: 0) == nil, "should not work radixes <= 0")
        XCTAssert(parseInt("10", radix: -2) == nil, "should not work radixes <= 0")
        XCTAssert(parseInt("-1011", radix: 2) == -11, "should not work negative numbers")
        XCTAssert(parseInt("0x1001", radix: 2) == 9, "should work with 0x prefix")
        XCTAssert(parseInt("-0x1001", radix: 2) == -9, "should work with negative sign and 0x prefix")
        XCTAssert(parseInt("0x-a0f") == nil, "should be nil, bad format")
    }
}
