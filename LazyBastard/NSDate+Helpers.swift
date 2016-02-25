//
//  NSDate+Helpers.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 24/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import Foundation


extension NSDate {
    
    var startOfDay: NSDate {
        return NSCalendar.currentCalendar().startOfDayForDate(self)
    }
    
    var endOfDay: NSDate? {
        let components = NSDateComponents()
        components.day = 1
        components.second = -1
        return NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: startOfDay, options: NSCalendarOptions())
    }
    
}