//
//  jsDictionary.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/4/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import Foundation

extension Dictionary {
    func keys() -> Array<Key> {
        return self.keys.array
    }
    
    func toString() -> String {
        return self.description
    }
}
