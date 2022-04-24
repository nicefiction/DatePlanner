// MARK: - LIBRARIES
import SwiftUI



struct EventRow: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let event: Event
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        HStack {
            Image(systemName: event.symbol)
                .sfSymbolStyling()
                .foregroundStyle(event.color)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(event.title)
                    .fontWeight(.bold)
                
                Text(event.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            if event.isComplete {
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundStyle(.secondary)
            }
            
        }
        .badge(event.remainingTaskCount)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    
}






// PREVIEW /////////////////////////////////
struct EventRow_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        EventRow(event: Event.example)
    }
}
