//
//  ContentView.swift
//  SwiftDataCloudkitSync
//
//  Created by Thomas Cowern on 7/24/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var conttext
    @Query private var vegatables: [Vegetable]
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
               TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        let vegetable = Vegetable(name: name)
                        conttext.insert(vegetable)
                        name = ""
                    }
                Spacer()
                List {
                    ForEach(vegatables, id: \.self) { vegetable in
                        NavigationLink {
                            NoteListScreen()
                        } label: {
                            Text(vegetable.name)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Garden Greens")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Vegetable.self])
}
