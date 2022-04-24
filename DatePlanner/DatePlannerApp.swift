// MARK: - LIBRARIES
import SwiftUI



@main
struct DatePlannerApp: App {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @StateObject private var eventData = EventData()
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView {
                EventList()
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
            .environmentObject(eventData)
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





/*
 // MARK: - STATIC PROPERTIES
 // MARK: - PROPERTY WRAPPERS
 // MARK: - PROPERTIES
 // MARK: - COMPUTED PROPERTIES
 var body: some View {
 
     Text("Hello, world!")
 }
 
 
 
 // MARK: - STATIC METHODS
 // MARK: - INITIALIZERS
 // MARK: - METHODS
 // MARK: - HELPER METHODS
 */
/*
 // MARK: - STATIC PROPERTIES
 // MARK: - PROPERTY WRAPPERS
 // MARK: - PROPERTIES
 // MARK: - COMPUTED PROPERTIES
 // MARK: - STATIC METHODS
 // MARK: - INITIALIZERS
 // MARK: - METHODS
 // MARK: - HELPER METHODS
 */
/*
 // PREVIEW ////////////////////////////////////
 
 // MARK: - STATIC PROPERTIES
 // MARK: - COMPUTED PROPERTIES
 */
