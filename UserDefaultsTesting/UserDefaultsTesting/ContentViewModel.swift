//
//  ContentViewModel.swift
//  UserDefaultsTesting
//
//  Created by Thomas Cowern on 3/27/24.
//

import Foundation

final class ContentViewModel: ObservableObject {
    
    @Published private(set) var notes: [Note] = []
    
    func saveNote(title: String, noteBody: String) {
        
        let newNote = Note(title: title, body: noteBody)
        
        do {
            
            var notes = getNotes()
            
            notes.append(newNote)
            
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
    
    func getNotes() -> [Note] {
        // Read/Get Data
        print("inside get notes")
        if let data = UserDefaults.standard.data(forKey: "notes") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                notes = try decoder.decode([Note].self, from: data)
                
                print("Notes from get notes", notes)
                
                

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        return notes
    }
}
