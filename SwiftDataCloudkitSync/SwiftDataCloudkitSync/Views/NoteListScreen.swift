//
//  NoteListScreen.swift
//  SwiftDataCloudkitSync
//
//  Created by Thomas Cowern on 7/29/24.
//

import SwiftUI

struct NoteListScreen: View {
    
//    let vegetable: Vegetable
    @State private var text: String = ""
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        TextField("Note text", text: $text)
            .textFieldStyle(.roundedBorder)
            .padding()
            .onSubmit {
                let note = Note(text: text)
//                note.vegetable = vegetable
                context.insert(note)
            }
        Spacer()
    }
}

#Preview {
    NoteListScreen()
}
