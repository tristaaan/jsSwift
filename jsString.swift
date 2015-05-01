import Foundation

extension String {
    func substring(start:Int, end:Int) -> String {
        if end >= start {
            return ""
        }
        let startIndex:String.Index = advance(self.startIndex, start)
        let endIndex:String.Index = advance(self.endIndex, -(count(self)-end))
        let range:Range<String.Index> = Range<String.Index>(start: startIndex, end: endIndex)
        return self.substringWithRange(range)
    }
    
    func substr(start:Int, end:Int) -> String {
        return self.substring(start, end: end)
    }
    
    func indexOf(str:String, start:Int = 0) -> Int {
        var out = -1
        let startIndex:String.Index = advance(self.startIndex, start)
        if let strRange:Range<String.Index> = self.rangeOfString(str, range:Range<String.Index>(start: startIndex, end:self.endIndex)) {
            for var i:String.Index = self.startIndex; i != strRange.startIndex; i = i.successor() {
                out += 1
            }
        }
        return out
    }
    
    mutating func trim() {
        self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    func charAt(loc:Int) -> Character? {
        if loc < 0 || loc >= count(self) {
            return nil
        }
        let index:String.Index = advance(self.startIndex, loc)
        return self[index]
    }
    
    subscript(i:Int) -> Character? {
        return self.charAt(i)
    }
}