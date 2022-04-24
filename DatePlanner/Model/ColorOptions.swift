// MARK: - LIBRARIES
import Foundation
import SwiftUI



struct ColorOptions {
    
    // MARK: - STATIC PROPERTIES
    static var all: [Color] = [
        .primary,
        .gray,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .cyan,
        .indigo,
        .purple,
    ]
    
    
    static var `default` : Color = Color.primary

    
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    static func random()
    -> Color {
        
        if let element = ColorOptions.all.randomElement() {
            return element
        } else {
            return .primary
        }
    }
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}
