//
//  jsDate.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/4/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import Foundation

extension Date {
    
    init(year:Int, month:Int, day:Int=0, hour:Int=0, minute:Int=0, seconds:Int=0) {
        var comp:DateComponents = DateComponents()
        comp.year  = year
        comp.month = month
        comp.day   = day
        comp.hour  = hour
        comp.minute = minute
        comp.second = seconds
        let cal = Calendar.current
        
        self.init(timeInterval: 0, since: cal.date(from: comp)!)
    }
    
    internal func localeCal() -> Calendar {
        let cal:Calendar = Calendar.current;
        return cal
    }
    
    //MARK: Getters
    static func now() -> Double {
        return NSTimeIntervalSince1970
    }
    
    func getSeconds() -> Int {
        return Calendar.current.component(.second, from: self)
    }
    
    func getMinutes() -> Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    func getHours() -> Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    func getDate() -> Int {
        return Calendar.current.component(.day, from: self)
    }
    
    func getDay() -> Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    func getMonth() -> Int {
        return Calendar.current.component(.month, from: self)
    }
    
    func getFullYear() -> Int {
        return Calendar.current.component(.year, from: self)
    }
    
    //MARK: Setters
    
    //MARK: Conversion Getters
    func toLocaleString() -> String {
        return self.description(with: Locale.current)
    }
    
    func toString() -> String {
        return self.description
    }
    
    func toDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
    
    func toTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .long
        return formatter.string(from: self)
    }
}
