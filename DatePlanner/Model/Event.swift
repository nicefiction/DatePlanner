// MARK: - LIBRARIES
import Foundation
import SwiftUI



struct Event: Identifiable,
                Hashable {
    
    // MARK: - STATIC PROPERTIES
    static var example = Event(
        symbol: "case.fill",
        title: "Sayulita Trip",
        tasks: [
            EventTask(text: "Buy plane tickets"),
            EventTask(text: "Get a new bathing suit"),
            EventTask(text: "Find an airbnb"),
        ],
        date: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365 * 1.5)
    )
    
    
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    var id = UUID()
    var symbol: String = EventSymbols.randomName()
    var color: Color = ColorOptions.random()
    var title = ""
    var tasks = [EventTask(text: "")]
    var date = Date()
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var remainingTaskCount: Int {
        return tasks.filter { !$0.isCompleted }.count
    }
    
    
    var isComplete: Bool {
        return tasks.allSatisfy { $0.isCompleted }
    }
    
    
    var isPast: Bool {
        return date < Date.now
    }
    
    
    var isWithinSevenDays: Bool {
        return !isPast && date < Date.now.sevenDaysOut
    }
    
    
    var isWithinSevenToThirtyDays: Bool {
        return !isPast && !isWithinSevenDays && date < Date.now.thirtyDaysOut
    }
    
    
    var isDistant: Bool {
        return date >= Date().thirtyDaysOut
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS


}

// Convenience methods for dates.

