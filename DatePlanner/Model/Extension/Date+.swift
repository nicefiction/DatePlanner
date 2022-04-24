//
//  Date.swift
//  DatePlanner
//
//  Created by Olivier Van hamme on 24/04/2022.
//

// MARK: - LIBRARIES
import Foundation


extension Date {
    
    static func from(month: Int,
                     day: Int,
                     year: Int)
    -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let calendar = Calendar(identifier: .gregorian)
        if let date = calendar.date(from: dateComponents) {
            return date
        } else {
            return Date()
        }
    }
    
    
    static func roundedHoursFromNow(_ hours: Double)
    -> Date {
        
        let exactDate = Date(timeIntervalSinceNow: hours)
        guard let hourRange = Calendar.current.dateInterval(of: .hour, for: exactDate)
        else { return exactDate }
        
        return hourRange.end
    }
    
    
    var sevenDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day,
                                          value: 7,
                                          to: self) ?? self
    }
    
    
    var thirtyDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day,
                                          value: 30,
                                          to: self) ?? self
    }
}
