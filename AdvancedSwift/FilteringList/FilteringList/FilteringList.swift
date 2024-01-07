//
//  FilteringList.swift
//  FilteringList
//
//  Created by Thomas Cowern on 1/7/24.
//

import Foundation
import SwiftUI

struct FilteringList<T: Identifiable, Content: View>: View {
    
    @State private var filteredItems = [T]()
    @State private var filteredString = ""
    
    let listItems: [T]
    let filterKeyPaths: [KeyPath<T, String>]
    let content: (T) -> Content
    
    var body: some View {
        VStack {
            TextField("Type to filter", text: $filteredString.onChange(applyFilter))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            List(filteredItems, rowContent: content)
                .onAppear(perform: applyFilter)
        }
    }
    
    init(_ data: [T], filterKeys: KeyPath<T, String>..., @ViewBuilder rowContent: @escaping (T) -> Content) {
        listItems = data
        filterKeyPaths = filterKeys
        content = rowContent
    }
    
    func applyFilter() {
        let cleanedFilter = filteredString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanedFilter.isEmpty {
            filteredItems = listItems
        } else {
            filteredItems = listItems.filter { element in
                filterKeyPaths.contains {
                    element[keyPath: $0]
                        .localizedCaseInsensitiveContains(cleanedFilter)
                }
            }
        }
    }

}
