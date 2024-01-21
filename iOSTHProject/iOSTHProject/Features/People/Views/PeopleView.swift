//
//  PeopleView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/17/24.
//

import SwiftUI

struct PeopleView: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var users: [User] = []
    @State private var showCreate: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(users, id: \.id) { user in
                            NavigationLink {
                                DetailView()
                            } label: {
                                PersonItemView(user: user)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("People")
                
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    create
                }
            }
            .onAppear {
     
                NetworkingManager.shared.request("https://reqres.in/api/users", type: UsersResponse.self) { res in
                    switch res {
                    case.success(let response):
                        users = response.data
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
            .sheet(isPresented: $showCreate, content: {
                CreateView()
            })
        }
    }
}

#Preview {
    PeopleView()
}

extension PeopleView {
    var create: some View {
        Button(action: {
            showCreate.toggle()
        }, label: {
            Symbols.plus
                .font(.system(.headline, design: .rounded))
                .bold()
        })
    }
    
    var background: some View {
        Theme.background
    }
}
