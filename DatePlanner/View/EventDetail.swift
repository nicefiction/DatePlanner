// MARK: - LIBRARIES
import SwiftUI



struct EventDetail: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @Binding var event: Event
    
    @State private var isPickingSymbol = false
    
    
    
    // MARK: - PROPERTIES
    let isEditing: Bool
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        List {
            
            HStack {
                Button {
                    isPickingSymbol.toggle()
                } label: {
                    Image(systemName: event.symbol)
                        .sfSymbolStyling()
                        .foregroundColor(event.color)
                        .opacity(isEditing ? 0.3 : 1)
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 5)
                
                if isEditing {
                    TextField("New Event", text: $event.title)
                        .font(.title2)
                } else {
                    Text(event.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
            }
            
            if isEditing {
                DatePicker("Date", selection: $event.date)
                    .labelsHidden()
                    .listRowSeparator(.hidden)
                
            } else {
                HStack {
                    Text(event.date, style: .date)
                    Text(event.date, style: .time)
                }
                .listRowSeparator(.hidden)
            }
            
            Text("Tasks")
                .fontWeight(.bold)
            
            ForEach($event.tasks) { $item in
                TaskRow(task: $item, isEditing: isEditing)
            }
            .onDelete(perform: { indexSet in
                event.tasks.remove(atOffsets: indexSet)
            })
            
            Button {
                event.tasks.append(EventTask(text: "", isNew: true))
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add Task")
                }
            }
            .buttonStyle(.borderless)
        }
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
        .sheet(isPresented: $isPickingSymbol) {
            SymbolPicker(event: $event)
        }
    }
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    
    
}






// PREVIEW ////////////////////////////////////
struct EventDetail_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        EventDetail(event: .constant(Event.example), isEditing: true)
    }
}
