//
//  Period.swift
//  DatePlanner
//
//  Created by Olivier Van hamme on 24/04/2022.
//

import Foundation


enum Period: String,
             CaseIterable,
             Identifiable {
    
    case nextSevenDays = "Next 7 Days"
    case nextThirtyDays = "Next 30 Days"
    case future = "Future"
    case past = "Past"
    
    
    // MARK: - COMPUTED PROPERTIES
    var id: String {  return self.rawValue }
    var name: String { return self.rawValue }
}
