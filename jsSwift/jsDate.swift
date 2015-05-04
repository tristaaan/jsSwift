//
//  jsDate.swift
//  jsSwift
//
//  Created by Tristan Wright on 5/4/15.
//  Copyright (c) 2015 thesixsides. All rights reserved.
//

import Foundation

extension NSDate {
    func now() -> Double {
        return NSTimeIntervalSince1970
    }
    
    internal func localeCal() -> NSCalendar{
        let locale:NSLocale = NSLocale.autoupdatingCurrentLocale()
        let cal:NSCalendar = NSCalendar.init();
        cal.locale = locale
        return cal
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