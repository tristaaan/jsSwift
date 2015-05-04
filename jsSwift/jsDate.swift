//
//  jsDate.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/4/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import Foundation

extension NSDate {
    
    convenience init(year:Int=0, month:Int=0, day:Int=0, hour:Int=0, minute:Int=0, seconds:Int=0){
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
    
    internal func localeCal() -> NSCalendar{
        let cal:NSCalendar = NSCalendar.currentCalendar();
        return cal
    }
    
    func now() -> Double {
        return NSTimeIntervalSince1970
    }
    
    func getSeconds() -> Int {
        let comp:NSDateComponents = localeCal().components(NSCalendarUnit.CalendarUnitSecond, fromDate: self)
        return comp.second
    }
    
    func getMinutes() -> Int {
        let comp:NSDateComponents = localeCal().components(NSCalendarUnit.CalendarUnitMinute, fromDate: self)
        return comp.minute
    }
    
    func getHours() -> Int {
        let comp:NSDateComponents = localeCal().components(NSCalendarUnit.CalendarUnitHour, fromDate: self)
        return comp.hour
    }
    
    func getDay() -> Int {
        let comp:NSDateComponents = localeCal().components(NSCalendarUnit.CalendarUnitDay, fromDate: self)
        return comp.day
    }
    
    func getMonth() -> Int {
        let comp:NSDateComponents = localeCal().components(NSCalendarUnit.CalendarUnitMonth, fromDate: self)
        return comp.month
    }
    
    func getYear() -> Int {
        let comp:NSDateComponents = localeCal().components(NSCalendarUnit.CalendarUnitYear, fromDate: self)
        return comp.year
    }
}