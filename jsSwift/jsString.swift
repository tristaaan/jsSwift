import Foundation

extension String {
    var length:Int {get { return count(self) }}

    func substring(start:Int, var end:Int = -1) -> String {
        if end < 0 {
            end = count(self)
        }
        else {
            end = min(end, count(self))
        }
        
        if start >= end {
            return ""
        }
        
        let startIndex:String.Index = advance(self.startIndex, start)
        let endIndex:String.Index = advance(self.endIndex, -(count(self)-end))
        let range:Range<String.Index> = Range<String.Index>(start: startIndex, end: endIndex)
        return self.substringWithRange(range)
    }
    
    func substr(start:Int, var end:Int = -1) -> String {
        if end < 0 {
            end = count(self)
        }
        return self.substring(start, end: end)
    }
    
    func indexOf(str:String, var start:Int = 0) -> Int {
        var out = -1
        
        if start > count(self) {
            return out
        }
        else if start < 0 {
            start = 0
        }
        
        let startIndex:String.Index = advance(self.startIndex, start)
        if let strRange:Range<String.Index> = self.rangeOfString(str, range:Range<String.Index>(start: startIndex, end:self.endIndex)) {
            out = 0
            for var i:String.Index = self.startIndex; i != strRange.startIndex; i = i.successor() {
                out += 1
            }
        }
        return out
    }
    
    func split(token:String) -> Array<String> {
        return self.componentsSeparatedByString(token)
    }

    mutating func trim() {
        self = self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    func charAt(loc:Int) -> Character? {
        if loc < 0 || loc >= count(self) {
            return nil
        }
        let index:String.Index = advance(self.startIndex, loc)
        return self[index] //this may look like charAt calls the subscript below but index is a String.Index here
    }
    
    subscript(i:Int) -> Character? {
        return self.charAt(i)
    }

    func link(url:String) -> String {
        return "<a href=\"\(url)\">\(self)</a>"
    }

    func toUpperCase() -> String {
        return self.uppercaseString
    }
    
    func toLowerCase() -> String {
        return self.lowercaseString
    }
    
    func toLocaleUpperCase() -> String {
        return self.uppercaseStringWithLocale(NSLocale.autoupdatingCurrentLocale())
    }
    
    func toLocaleLowerCase() -> String {
        return self.lowercaseStringWithLocale(NSLocale.autoupdatingCurrentLocale())
    }
}