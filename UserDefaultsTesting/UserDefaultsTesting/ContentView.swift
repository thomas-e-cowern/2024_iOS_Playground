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


struct ContentView: View {
    
    @State private var title: String = ""
    @State private var noteBody: String = ""
    @State var notes: [Note]?
    
    @StateObject private var cvm = ContentViewModel()
    
    var body: some View {
        VStack {
            
            VStack {
                Form {
                    ForEach(notes!, id: \.id) { note in
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
                cvm.saveNote(title: title, noteBody: noteBody)
                notes = cvm.getNotes()
                title = ""
                noteBody = ""
            }
            
        }
        .padding()
        .onAppear {
            notes = cvm.getNotes()
        }
    }
        
}

#Preview {
    
    var previewContentView: [Note] {
        let notes = [Note(title: "note 1", body: "note body for 1")]
        
        return notes
    }
    
    
     return ContentView(notes: previewContentView)
}
