// MARK: - PURPOSE
///You use the `EventData` observable object
///to populate the data in your event list.

// MARK: - LIBRARIES
import Foundation
import SwiftUI



class EventData: ObservableObject {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @Published var events: [Event] = [
        Event(symbol: "gift.fill",
              color: .red,
              title: "Maya's Birthday",
              tasks: [EventTask(text: "Guava kombucha"),
                      EventTask(text: "Paper cups and plates"),
                      EventTask(text: "Cheese plate"),
                      EventTask(text: "Party poppers"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)),
        Event(symbol: "theatermasks.fill",
              color: .yellow,
              title: "Pagliacci",
              tasks: [EventTask(text: "Buy new tux"),
                      EventTask(text: "Get tickets"),
                      EventTask(text: "Pick up Carmen at the airport and bring her to the show"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 22)),
        Event(symbol: "facemask.fill",
              color: .indigo,
              title: "Doctor's Appointment",
              tasks: [EventTask(text: "Bring medical ID"),
                      EventTask(text: "Record heart rate data"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 4)),
        Event(symbol: "leaf.fill",
              color: .green,
              title: "Camping Trip",
              tasks: [EventTask(text: "Find a sleeping bag"),
                      EventTask(text: "Bug spray"),
                      EventTask(text: "Paper towels"),
                      EventTask(text: "Food for 4 meals"),
                      EventTask(text: "Straw hat"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 36)),
        Event(symbol: "gamecontroller.fill",
              color: .cyan,
              title: "Game Night",
              tasks: [EventTask(text: "Find a board game to bring"),
                      EventTask(text: "Bring a desert to share"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 2)),
        Event(symbol: "graduationcap.fill",
              color: .primary,
              title: "First Day of School",
              tasks: [
                EventTask(text: "Notebooks"),
                EventTask(text: "Pencils"),
                EventTask(text: "Binder"),
                EventTask(text: "First day of school outfit"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365)),
        Event(symbol: "book.fill",
              color: .purple,
              title: "Book Launch",
              tasks: [
                EventTask(text: "Finish first draft"),
                EventTask(text: "Send draft to editor"),
                EventTask(text: "Final read-through"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365 * 2)),
        Event(symbol: "globe.americas.fill",
              color: .gray,
              title: "WWDC",
              tasks: [
                EventTask(text: "Watch Keynote"),
                EventTask(text: "Watch What's new in SwiftUI"),
                EventTask(text: "Go to DT developer labs"),
                EventTask(text: "Learn about Create ML"),
              ],
              date: Date.from(month: 6, day: 7, year: 2021)),
        Event(symbol: "case.fill",
              color: .orange,
              title: "Sayulita Trip",
              tasks: [
                EventTask(text: "Buy plane tickets"),
                EventTask(text: "Get a new bathing suit"),
                EventTask(text: "Find a hotel room"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 19)),
    ]
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    func delete(_ event: Event)
    -> Void {
        
        events.removeAll { $0.id == event.id }
    }
    
    
    func add(_ event: Event)
    -> Void {
        
        events.append(event)
    }
    
    
    func exists(_ event: Event)
    -> Bool {
        
        events.contains(event)
    }
    
    
    func sortedEvents(period: Period)
    -> Binding<[Event]> {
        
        Binding<[Event]>(
            get: {
                self.events
                    .filter {
                        switch period {
                        case .nextSevenDays:
                            return $0.isWithinSevenDays
                        case .nextThirtyDays:
                            return $0.isWithinSevenToThirtyDays
                        case .future:
                            return $0.isDistant
                        case .past:
                            return $0.isPast
                        }
                    }
                    .sorted { $0.date < $1.date }
            },
            set: { events in
                for event in events {
                    if let index = self.events.firstIndex(where: { $0.id == event.id }) {
                        self.events[index] = event
                    }
                }
            }
        )
    }
    // MARK: - HELPER METHODS
}
