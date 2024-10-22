//
//  NavigationModal.swift
//  RebeloperPlayground
//
//  Created by Thomas Cowern on 10/22/24.
//

import SwiftUI

enum NavigationModalType {
    case fullScreenCover
    case sheet
}

struct NavigationModal<Value: View, Label: View, D: Hashable & View>: View {
    
    @State private var isPresented: Bool = false
    
    var type: NavigationModalType
    var value: Value
    let data: D.Type
    let onDismiss: (() -> Void)?
    
    @ViewBuilder var label: () -> Label
    
    init(_ type: NavigationModalType, value: Value, data: D.Type, onDismiss:(() -> Void)? = nil, @ViewBuilder label: @escaping () -> Label) {
        self.type = type
        self.value = value
        self.data = data
        self.onDismiss = onDismiss
        self.label = label
    }
    
    var body: some View {
        Button {
            isPresented.toggle()
        } label: {
            label()
        }
        .if(type == .sheet) { view in
            view
                .sheet(isPresented: $isPresented, onDismiss: onDismiss) {
                    NavigationStack {
                        value
                            .navigationLinkValues(data)
                    }
                }
        }
        .if(type == .fullScreenCover) { view in
            view
                .fullScreenCover(isPresented: $isPresented, onDismiss: onDismiss) {
                    NavigationStack {
                        value
                            .navigationLinkValues(data)
                    }
                }
        }
    }
}

