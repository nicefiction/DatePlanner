// MARK: - LIBRARIES
import SwiftUI



struct SymbolPicker: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @Binding var event: Event
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedColor: Color = ColorOptions.default
    @State private var symbolNames = EventSymbols.symbolNames
    @State private var searchInput = ""
    
    
    
    // MARK: - PROPERTIES
    var columns = Array(repeating: GridItem(.flexible()), count: 6)
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
                .padding()
            }
            HStack {
                Image(systemName: event.symbol)
                    .font(.title)
                    .imageScale(.large)
                    .foregroundColor(selectedColor)
                
            }
            .padding()
            
            HStack {
                ForEach(ColorOptions.all, id: \.self) { color in
                    Button {
                        selectedColor = color
                        event.color = color
                    } label: {
                        Circle()
                            .foregroundColor(color)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 40)
            
            Divider()
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(symbolNames, id: \.self) { symbolItem in
                        Button {
                            event.symbol = symbolItem
                        } label: {
                            Image(systemName: symbolItem)
                                .sfSymbolStyling()
                                .foregroundColor(selectedColor)
                                .padding(5)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .drawingGroup()
            }
        }
        .onAppear {
            selectedColor = event.color
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEW ////////////////////////////////////

struct SFSymbolBrowser_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        SymbolPicker(event: .constant(Event.example))
    }
}
