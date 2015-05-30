//
//  jsBuiltIns.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/16/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import Foundation

func parseInt(var str:String, radix:Int = 10) -> Int? {
    str = str.lowercaseString
    
    //check for negative sign, if it's there str = substring(1,str.length)
    let negative:Bool = str.hasPrefix("-")
    if negative {
        str = str.substringFromIndex(str.startIndex.successor())
    }
    
    //check for 0x prefix
    while str.hasPrefix("0x") {
        let newStart:String.Index = advance(str.startIndex, 2)
        str = str.substringFromIndex(newStart)
    }
    
    var out:Int = 0
    // basic base-10 toInt()
    if radix == 10 {
        if let ret:Int = str.toInt() {
            return ret
        }
        // return nil if not toInt-able
        else {
            return nil
        }
    }
    // radix cannot be <= 0 or > 36
    else if radix <= 0 || radix > 36 {
        return nil
    }
    // radix between 1 and 9 inclusive
    else if radix < 10 && radix > 0 {
        // iterate through the characters in reverse, increment j every time
        var j:Int = 0
        for char:Character in lazy(str).reverse() {
            // is character toInt-able?
            if let digit:Int = String(char).toInt() {
                // out += digit * radix ^ j, a lot of conversions needed here
                out += Int(
                    Double(digit) *
                    pow(Double(radix), Double(j))
                )
                j += 1
            }
            // return nil if char is not toInt-able
            else {
                return nil
            }
        }
    }
    // radix > 10 o_O
    else if radix > 10 {
        // once again we iterate through the string in reverse ...
        let alphabet:String = "abcdefghijklmnopqrstuvwxyz"
        var j:Int = 0
        for char:Character in lazy(str).reverse() {
            if let digit:Int = String(char).toInt() {
                out += Int(
                    Double(digit) *
                    pow(Double(radix), Double(j))
                )
                j += 1
            }
            // but now, if the character is not toInt-able, see if it's in the alphabet
            // if it's in the alphabet, get the index of it and: out += digit * radix ^ index
            else {
                if let strRange:Range<String.Index> = alphabet.rangeOfString(String(char),
                    range:Range<String.Index>(start: alphabet.startIndex, end:alphabet.endIndex)
                    ) {
                        var index:Int = 10
                        for var i:String.Index = alphabet.startIndex; i != strRange.startIndex; i = i.successor() {
                            index += 1
                        }
                        out += Int(
                            Double(index) *
                            pow(Double(radix), Double(j))
                        )
                        j += 1
                }
                // if not in the alphabet return nil
                else {
                    return nil
                }
            }
        }
    }
    else {
        return nil
    }
    
    // from the negative check at the start of the func
    if negative {
        out *= -1
    }
    
    return out
}