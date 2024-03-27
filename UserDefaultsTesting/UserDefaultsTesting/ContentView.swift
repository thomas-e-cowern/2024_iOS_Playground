//
//  ContentView.swift
//  UserDefaultsTesting
//
//  Created by Thomas Cowern on 3/27/24.
//

import SwiftUI

struct Note: Codable {

    // MARK: - Properties

    var id = UUID()

    // MARK: -

    let title: String
    let body: String

}

// Create Note
let note = Note(title: "My Note", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")


struct ContentView: View {
    
    @State private var title: String = ""
    @State private var noteBody: String = ""
    @State private var notes: [Note] = []
    
    var body: some View {
        VStack {
            
            VStack {
                Form {
                    ForEach(notes, id: \.id) { note in
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.title2)
                            Text(note.body)
                                .font(.subheadline)
                        }
                    }
                }
            }
            
            TextField("Enter title here...", text: $title)
                .padding(10)
                .border(.black)
            
            TextField("Enter note here...", text: $noteBody)
                .padding(10)
                .border(.black)
            
            
            Button("Save") {
                do {
                    let note = Note(title: title, body: noteBody)
                    
                    notes.append(note)
                    
                    // Create JSON Encoder
                    let encoder = JSONEncoder()

                    // Encode Note
                    let data = try encoder.encode(notes)
                    
                    // Write/Set Data
                    UserDefaults.standard.set(data, forKey: "notes")

                } catch {
                    print("Unable to Encode Note (\(error))")
                }
            }
            
        }
        .padding()
        .onAppear {
            // Read/Get Data
            if let data = UserDefaults.standard.data(forKey: "notes") {
                do {
                    // Create JSON Decoder
                    let decoder = JSONDecoder()

                    // Decode Note
                    notes = try decoder.decode([Note].self, from: data)
                    
                    print(notes)

                } catch {
                    print("Unable to Decode Notes (\(error))")
                }
            }
        }
    }
        
}

#Preview {
    ContentView()
}
