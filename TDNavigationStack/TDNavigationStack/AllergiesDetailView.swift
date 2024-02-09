//
//  AllergiesDetailView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/9/24.
//

import SwiftUI

struct AllergiesDetailView: View {
    
    let allergies: [Allergy]
    
    var body: some View {
        List {

            Section {
                ForEach(allergies, id: \.name) { allergy in
                    /*@START_MENU_TOKEN@*/Text(allergy.name)/*@END_MENU_TOKEN@*/
                }
            } footer: {
                Text("This item may contain traces of the following above")
            }
        }
        .navigationTitle("Allergies")
    }
}

#Preview {
    AllergiesDetailView(allergies: desserts[0].allergies!)
}
