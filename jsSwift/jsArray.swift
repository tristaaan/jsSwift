extension Array {
    var length:Int {get { return self.count }}

    func every(fn: (T)->Bool) -> Bool {
        var out = true
        for i in self {
            out = out && fn(i);
        }
        return out
    }
    
    func some(fn: (T) -> Bool) -> Bool {
        var out = false
        for i in self {
            out = out || fn(i);
        }
        return out
    }
    
    func toString() -> String {
        return self.description
    }
    
    func concat(arr:Array<T>) -> Array<T> {
        return self + arr
    }
    
    mutating func push(el:T) -> Int {
        self.append(el)
        return self.count
    }
    
    mutating func pop() -> T? {
        if self.count == 0 {
            return nil
        }
        let out = self[self.count-1]
        self.removeLast()
        return out
    }
    
    mutating func unshift(el:T) -> Int {
        self.insert(el, atIndex: 0)
        return self.count
    }
    
    mutating func shift() -> T? {
        if self.count == 0 {
            return nil
        }
        let out = self[0]
        self.removeAtIndex(0)
        return out
    }
}