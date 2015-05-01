extension Array {
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
    
    func concat(arr:Array<T>) -> Array<T> {
        var out:Array<T> = self
        for i in arr {
            out.append(i)
        }
        return out
    }
    
    mutating func push(el:T) -> Int {
        self.append(el)
        return self.count
    }
    
    mutating func pop() -> T? {
        if self.count == 0 {
            return nil
        }
        let ret = self[self.count-1]
        self.removeLast()
        return ret
    }
    
    mutating func unshift(el:T) -> Int {
        self.insert(el, atIndex: 0)
        return self.count
    }
    
    mutating func shift() -> T? {
        if self.count == 0 {
            return nil
        }
        let ret = self[0]
        self.removeAtIndex(0)
        return ret
    }
}