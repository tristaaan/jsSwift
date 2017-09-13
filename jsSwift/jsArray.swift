extension Array {
    var length:Int {get { return self.count }}

    func every(_ fn:(Element)->Bool) -> Bool {
        var out = true
        for i in self {
            out = out && fn(i);
        }
        return out
    }
    
    func some(_ fn:(Element) -> Bool) -> Bool {
        var out = false
        for i in self {
            out = out || fn(i);
        }
        return out
    }
    
    func toString() -> String {
        return self.description
    }
    
    func concat(_ arr:Array<Element>) -> Array<Element> {
        return self + arr
    }
    
    func indexOf(_ searchElement:Element) -> Int? {
        return -1
    }
    
    mutating func push(_ el:Element) -> Int {
        self.append(el)
        return self.count
    }
    
    mutating func pop() -> Element? {
        if self.count == 0 {
            return nil
        }
        let out = self[self.count-1]
        self.removeLast()
        return out
    }
    
    mutating func unshift(_ el:Element) -> Int {
        self.insert(el, at: 0)
        return self.count
    }
    
    mutating func shift() -> Element? {
        if self.count == 0 {
            return nil
        }
        let out = self[0]
        self.remove(at: 0)
        return out
    }
}
