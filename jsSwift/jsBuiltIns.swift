//
//  jsBuiltIns.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/16/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import Foundation

func parseInt(var str:String, radix:Int=10) -> Int? {
    str = str.lowercaseString
    if radix == 10 {
        if let ret:Int = str.toInt() {
            return ret
        }
        else {
            return nil
        }
    }
    else if radix <= 0 || radix > 36 {
        return nil
    }
    else if radix < 10 && radix > 0 {
        var out:Int = 0
        var j:Int = 0
        for char:Character in lazy(str).reverse() {
            if let digit:Int = String(char).toInt() {
                out += Int(
                    Double(digit) *
                        pow(Double(radix), Double(j))
                )
                j += 1
            }
            else {
                return nil
            }
        }
        return out
    }
    else if radix > 10 {
        let alphabet:String = "abcdefghijklmnopqrstuvwxyz"
        var out:Int = 0
        var j:Int = 0
        for char:Character in lazy(str).reverse() {
            if let digit:Int = String(char).toInt() {
                out += Int(
                    Double(digit) *
                        pow(Double(radix), Double(j))
                )
                j += 1
            }
            else {
                if let strRange:Range<String.Index> = alphabet.rangeOfString(String(char),
                    range:Range<String.Index>(start: alphabet.startIndex, end:alphabet.endIndex)
                    ) {
                        var loc:Int = 10
                        for var i:String.Index = alphabet.startIndex; i != strRange.startIndex; i = i.successor() {
                            loc += 1
                        }
                        out += Int(
                            Double(loc) *
                                pow(Double(radix), Double(j))
                        )
                        j += 1
                }
                else {
                    return nil
                }
            }
        }
        return out
    }
    else {
        return nil
    }
}