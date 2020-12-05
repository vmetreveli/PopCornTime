//
//  Date+Ex.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 05.12.20.
//

import Foundation


import Foundation

extension Date {

    public func removeTimeStamp() -> Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
            fatalError("Failed to strip time from Date object")
        }
        return date
    }

    func toString(format: String? = "dd-MM-yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ka")
        dateFormatter.dateFormat = format
        //dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        return dateFormatter.string(from: self)
    }
    
    func toBeginningOfDate() -> Date{
        let calendar = Calendar.current
        
        // Replace the hour (time) of both dates with 00:00
        return calendar.startOfDay(for: self)
    }
    
    func getCurrentFrom(component: Calendar.Component) -> Int {
        let calendar = Calendar.current
        
        return calendar.component(component, from: self)
    }
    
    
    

}
