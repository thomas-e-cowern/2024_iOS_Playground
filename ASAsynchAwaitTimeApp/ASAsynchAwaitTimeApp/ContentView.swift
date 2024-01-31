//
//  ContentView.swift
//  ASAsynchAwaitTimeApp
//
//  Created by Thomas Cowern on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentDates: [CurrentDate] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List(currentDates, id: \.id) { date in
                    Text("\(date.date)")
                }
                .listStyle(.plain)
                .navigationTitle("Dates")
                .toolbar {
                    ToolbarItem {
                        Button {
                            Task {
                                await populateDates()
                            }
                            
                        } label: {
                            Image(systemName: "arrow.clockwise.circle")
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                Task {
                    await populateDates()
                }
            }
        }
    }
    
    private func getDate() async throws -> CurrentDate? {
        guard let url = URL(string: "https://planet-useful-bathroom.glitch.me/current-date") else {
            fatalError("URL is incorrect")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url) 
        
        return try JSONDecoder().decode(CurrentDate.self, from: data)
    }
    
    private func populateDates() async {
        do {
            guard let currentDate = try await getDate() else {
                return
            }
            
            self.currentDates.append(currentDate)
        } catch {
            print("Error getting dates in ContentView: \(error.localizedDescription)")
        }
        
    }
}

#Preview {
    ContentView()
}
