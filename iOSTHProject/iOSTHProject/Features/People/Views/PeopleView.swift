//
//  PeopleView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/17/24.
//

import SwiftUI

struct PeopleView: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0...5, id: \.self) { item in
                            VStack(spacing: .zero) {
                                Rectangle()
                                    .fill(.blue)
                                    .frame(height: 130)
                                VStack(alignment: .leading) {
                                    
                                    Text("#\(item)")
                                        .font(.system(.caption, design: .rounded).bold())
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 9)
                                        .padding(.vertical, 4)
                                        .background(Theme.pill, in: Capsule())
                                    
                                    Text("<first name> <last name>")
                                        .font(.system(.body, design: .rounded))
                                        .foregroundStyle(Theme.text)
                                        
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 5)
                                .background(Theme.detailBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
                        }
                    }
                    .padding()
                }
                .navigationTitle("People")
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        
                    }, label: {
                        Symbols.plus
                            .font(.system(.headline, design: .rounded))
                            .bold()
                    })
                }
            }
        }
    }
}

#Preview {
    PeopleView()
}
