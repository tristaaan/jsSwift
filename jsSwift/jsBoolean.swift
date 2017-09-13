//
//  jsBoolean.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/5/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import Foundation

extension Bool {
    
    init(str:String) {
        self.init(str.length != 0)
    }
    
    init(int:Int) {
        self.init(int != 0)
    }
    
    init(dbl:Double) {
        self.init(dbl != 0)
    }
    
    func toString() -> String {
        return self.description
    }
}
