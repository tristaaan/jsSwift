import Foundation

extension String {
    var length:Int {get { return self.count }}

    func substring(_ start:Int, end:Int = -1) -> String {
        var end = end
        if end < 0 {
            end = self.length
        } else {
            end = min(end, self.length)
        }
        
        if start >= end {
            return ""
        }
        
        let startIndex:String.Index = self.index(self.startIndex, offsetBy: start)
        let endIndex:String.Index = self.index(self.startIndex, offsetBy: end)
        return String(self[startIndex..<endIndex])
    }
    
    func substr(_ start:Int, end:Int = -1) -> String {
        var end = end
        if end < 0 {
            end = self.length
        }
        return self.substring(start, end: end)
    }
    
    func indexOf(_ str:String, start:Int = 0) -> Int {
        var start = start
        var out = -1
        
        if start > self.length {
            return out
        } else if start < 0 {
            start = 0
        }
        
        let startIndex:String.Index = self.index(self.startIndex, offsetBy:start)
        if let strRange:Range<String.Index> = self.range(of: str, range:(startIndex ..< self.endIndex)) {
            out = 0
            var i:String.Index = self.startIndex
            while (i != strRange.lowerBound) {
                i = self.index(i, offsetBy: 1)
                out += 1
            }
        }
        return out
    }
    
    func split(_ token:String) -> Array<String> {
        return self.components(separatedBy: token)
    }

    mutating func trim() {
        self = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func charAt(_ loc:Int) -> Character? {
        if loc < 0 || loc >= self.length {
            return nil
        }
        let index:String.Index = self.index(self.startIndex, offsetBy: loc)
        return self[index] //this may look like charAt calls the subscript below but index is a String.Index here
    }
    
    subscript(i:Int) -> Character? {
        return self.charAt(i)
    }

    func link(_ url:String) -> String {
        return "<a href=\"\(url)\">\(self)</a>"
    }

    func toUpperCase() -> String {
        return self.uppercased()
    }
    
    func toLowerCase() -> String {
        return self.lowercased()
    }
    
    func toLocaleUpperCase() -> String {
        return self.uppercased(with: Locale.autoupdatingCurrent)
    }
    
    func toLocaleLowerCase() -> String {
        return self.lowercased(with: Locale.autoupdatingCurrent)
    }
}
