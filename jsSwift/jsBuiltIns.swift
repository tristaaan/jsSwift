//
//  jsBuiltIns.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/16/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import Foundation

func parseInt(_ str:String, radix:Int = 10) -> Int? {
    var str:String = str.lowercased()
    
    //check for negative sign, if it's there str = substring(1,str.length)
    let negative:Bool = str.hasPrefix("-")
    if negative {
        str = String(str[str.index(after: str.startIndex)..<str.endIndex])
    }
    
    //check for 0x prefix
    while str.hasPrefix("0x") {
        str = String(str[str.index(str.startIndex, offsetBy:2)..<str.endIndex])
    }

    var out:Int = 0
    // basic base-10 toInt()
    if radix == 10 {
        if let ret:Int = Int(str) {
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
        for char:Character in str.reversed() {
            // is character toInt-able?
            if let digit:Int = Int(String(char)) {
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
        for char:Character in str.reversed() {
            // Plain digit.
            if let digit:Int = Int(String(char)) {
                out += Int(
                    Double(digit) *
                    pow(Double(radix), Double(j))
                )
                j += 1
            }
            // but now, if the character is not toInt-able, see if it's in the alphabet
            // if it's in the alphabet, get the index of it and: out += digit * radix ^ index
            else {
                let fullRange = alphabet.startIndex ..< alphabet.endIndex
                if let strRange:Range<String.Index> = alphabet.range(of: String(char),
                                                                     options: [],
                                                                     range:fullRange, locale: nil) {
                    var index:Int = 10
                    var i:String.Index = alphabet.startIndex
                    while i != strRange.lowerBound {
                        index += 1;
                        i = alphabet.index(i, offsetBy: 1)
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

func parseFloat(_ str:String) -> Float? {
    let str = str
    return (str as NSString).floatValue
}

func parseDouble(_ str:String) -> Double {
    let str = str
    return (str as NSString).doubleValue
}
