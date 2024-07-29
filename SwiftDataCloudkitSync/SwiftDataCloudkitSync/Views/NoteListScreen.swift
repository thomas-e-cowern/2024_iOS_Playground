//
//  NoteListScreen.swift
//  SwiftDataCloudkitSync
//
//  Created by Thomas Cowern on 7/29/24.
//

import SwiftUI
import SwiftData

struct NoteListScreen: View {
    
    let vegetable: Vegetable
    @State private var text: String = ""
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            TextField("Note text", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    let note = Note(text: text)
                    note.vegetable = vegetable
                    context.insert(note)
                    text = ""
            }
        }
        .navigationTitle(vegetable.name)
        
        Spacer()
        
        List {
            ForEach(vegetable.notes) { note in
                Text(note.text)          
            }
        }
            
    }
}

struct NoteListScreenContainerView: View {
    
    @Query private var vegetables: [Vegetable]
    
    var body: some View {
        NoteListScreen(vegetable: vegetables[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        NoteListScreenContainerView()
            .modelContainer(previewContainer)
    }
}
