// MARK: - LIBRARIES
import SwiftUI



struct EventEditor: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @Binding var event: Event
    
    @EnvironmentObject var eventData: EventData
    @Environment(\.dismiss) private var dismiss
    
    @State private var isDeleted = false
    @State private var eventCopy = Event()
    @State private var isEditing = false
    
    
    
    // MARK: - PROPERTIES
    var isNew: Bool = false
    
    
    
    // MARK: - COMPUTED PROPERTIES
    /// Keep a local copy in case we make edits, so we don't disrupt the list of events.
    /// This is important for when the date changes and puts the event in a different section.
    private var isEventDeleted: Bool {
        return !eventData.exists(event) && !isNew
    }
    
    
    var body: some View {
        
        VStack {
            EventDetail(event: $eventCopy, isEditing: isNew ? true : isEditing)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        if isNew {
                            Button("Cancel") {
                                dismiss()
                            }
                        }
                    }
                    ToolbarItem {
                        Button {
                            if isNew {
                                eventData.events.append(eventCopy)
                                dismiss()
                            } else {
                                if isEditing && !isDeleted {
                                    print("Done, saving any changes to \(event.title).")
                                    withAnimation {
                                        /// Put edits (if any) back in the store.
                                        event = eventCopy
                                    }
                                }
                                isEditing.toggle()
                            }
                        } label: {
                            Text(isNew ? "Add" : (isEditing ? "Done" : "Edit"))
                        }
                    }
                }
                .onAppear {
                    /// Grab a copy in case we decide to make edits.
                    eventCopy = event
                }
                .disabled(isEventDeleted)
            
            if isEditing && !isNew {
                
                Button(role: .destructive, action: {
                    isDeleted = true
                    dismiss()
                    eventData.delete(event)
                }, label: {
                    Label("Delete Event", systemImage: "trash.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                })
                .padding()
            }
        }
        .overlay(alignment: .center) {
            if isEventDeleted {
                Color(UIColor.systemBackground)
                Text("Event Deleted. Select an Event.")
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEW ////////////////////////////////////
struct EventEditor_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        EventEditor(event: .constant(Event.init()))
    }
}
