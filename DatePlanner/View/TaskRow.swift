// MARK: - LIBRARIES
import SwiftUI



struct TaskRow: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @Binding var task: EventTask
    
    @FocusState private var isFocused: Bool
    
    
    
    // MARK: - PROPERTIES
    var isEditing: Bool
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        HStack {
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            
            if isEditing || task.isNew {
                TextField("Task description", text: $task.text)
                    .focused($isFocused)
                    .onChange(of: isFocused) { newValue in
                        if newValue == false {
                            task.isNew = false
                        }
                    }
                
            } else {
                Text(task.text)
            }
            
            Spacer()
        }
        .padding(.vertical, 10)
        .task {
            if task.isNew {
                isFocused = true
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS

        
}






// PREVIEW ////////////////////////////////////

struct TaskRow_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        TaskRow(task: .constant(EventTask(text: "Do something!")),
                isEditing: false)
    }
}
