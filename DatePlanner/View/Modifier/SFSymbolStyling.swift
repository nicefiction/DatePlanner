// MARK: - LIBRARIES
import Foundation
import SwiftUI



struct SFSymbolStyling: ViewModifier {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    func body(content: Content)
    -> some View {
        
        content
            .imageScale(.large)
            .symbolRenderingMode(.monochrome)
    }
    
    
    
    // MARK: - HELPER METHODS
}
