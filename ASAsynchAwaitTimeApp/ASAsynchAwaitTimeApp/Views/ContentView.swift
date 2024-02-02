//
//  ContentView.swift
//  ASAsynchAwaitTimeApp
//
//  Created by Thomas Cowern on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var currentDateListVM = CurrentDateListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(currentDateListVM.currentDates, id: \.id) { date in
                    Text("\(date.date)")
                }
                .listStyle(.plain)
                .navigationTitle("Dates")
                .toolbar {
                    ToolbarItem {
                        Button {
                            Task {
                                await currentDateListVM.getAllDates()
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
                    await currentDateListVM.getAllDates()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
