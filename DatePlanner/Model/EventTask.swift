// MARK: - PURPOSE
/// An event task represents a to-do item for an event.
/// An `EventTask` represents one of a collection of to-do items for an event.

// MARK: - LIBRARIES
import Foundation




struct EventTask: Identifiable,
                  Hashable {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
    
    
    
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}
