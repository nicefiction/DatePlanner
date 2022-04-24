// MARK: - LIBRARIES
import Foundation



struct EventSymbols {
    
    // MARK: - STATIC PROPERTIES
    static var symbolNames: Array<String> = [
        "house.fill",
        "ticket.fill",
        "gamecontroller.fill",
        "theatermasks.fill",
        "ladybug.fill",
        "books.vertical.fill",
        "moon.zzz.fill",
        "umbrella.fill",
        "paintbrush.pointed.fill",
        "leaf.fill",
        "globe.americas.fill",
        "clock.fill",
        "building.2.fill",
        "gift.fill",
        "graduationcap.fill",
        "heart.rectangle.fill",
        "phone.bubble.left.fill",
        "cloud.rain.fill",
        "building.columns.fill",
        "mic.circle.fill",
        "comb.fill",
        "person.3.fill",
        "bell.fill",
        "hammer.fill",
        "star.fill",
        "crown.fill",
        "briefcase.fill",
        "speaker.wave.3.fill",
        "tshirt.fill",
        "tag.fill",
        "airplane",
        "pawprint.fill",
        "case.fill",
        "creditcard.fill",
        "infinity.circle.fill",
        "dice.fill",
        "heart.fill",
        "camera.fill",
        "bicycle",
        "radio.fill",
        "car.fill",
        "flag.fill",
        "map.fill",
        "figure.wave",
        "mappin.and.ellipse",
        "facemask.fill",
        "eyeglasses",
        "tram.fill",
    ]
    
    
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    static func randomName()
    -> String {
        
        if let random = symbolNames.randomElement() {
            return random
        } else {
            return ""
        }
    }
    
    
    static func randomNames(_ number: Int)
    -> Array<String> {
        
        var names: [String] = []
        for _ in 0..<number {
            names.append(randomName())
        }
        return names
    }
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}
