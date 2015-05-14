//
//  jsDate.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/4/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import Foundation

extension NSDate {
    
    convenience init(year:Int, month:Int, day:Int=0, hour:Int=0, minute:Int=0, seconds:Int=0) {
        let comp:NSDateComponents = NSDateComponents()
        comp.year  = year
        comp.month = month
        comp.day   = day
        comp.hour  = hour
        comp.minute = minute
        comp.second = seconds
        
        let cal:NSCalendar = NSCalendar.currentCalendar();
        self.init(timeInterval:0, sinceDate:cal.dateFromComponents(comp)!)
    }
    
    internal func localeCal() -> NSCalendar {
        let cal:NSCalendar = NSCalendar.currentCalendar();
        return cal
    }
    
    //MARK: Getters
    func now() -> Double {
        return NSTimeIntervalSince1970
    }
    
    func getSeconds() -> Int {
        let comp:NSDateComponents = self.localeCal().components(NSCalendarUnit.CalendarUnitSecond, fromDate: self)
        return comp.second
    }
    
    func getMinutes() -> Int {
        let comp:NSDateComponents = self.localeCal().components(NSCalendarUnit.CalendarUnitMinute, fromDate: self)
        return comp.minute
    }
    
    func getHours() -> Int {
        let comp:NSDateComponents = self.localeCal().components(NSCalendarUnit.CalendarUnitHour, fromDate: self)
        return comp.hour
    }
    
    func getDate() -> Int {
        let comp:NSDateComponents = self.localeCal().components(NSCalendarUnit.CalendarUnitDay, fromDate: self)
        return comp.day
    }
    
    func getDay() -> Int {
        let comp:NSDateComponents = self.localeCal().components(NSCalendarUnit.CalendarUnitWeekday, fromDate: self)
        return comp.weekday
    }
    
    func getMonth() -> Int {
        let comp:NSDateComponents = self.localeCal().components(NSCalendarUnit.CalendarUnitMonth, fromDate: self)
        return comp.month
    }
    
    func getFullYear() -> Int {
        let comp:NSDateComponents = self.localeCal().components(NSCalendarUnit.CalendarUnitYear, fromDate: self)
        return comp.year
    }
    
    //MARK: Setters
    
    //MARK: Conversion Getters
    func toLocaleString() -> String {
        return self.descriptionWithLocale(NSLocale.currentLocale())!
    }
    
    func toString() -> String {
        return self.description
    }
    
    func toDateString() -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        formatter.timeStyle = .NoStyle
        return formatter.stringFromDate(self)
    }
    
    func toTimeString() -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .NoStyle
        formatter.timeStyle = .LongStyle
        return formatter.stringFromDate(self)
    }
}