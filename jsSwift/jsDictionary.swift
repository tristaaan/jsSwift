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
        return Array(self.keys)
    }
    
    func hasOwnProperty(_ prop:Key) -> Bool {
        return self[prop] != nil
    }
    
    func toString() -> String {
        return self.description
    }
}
