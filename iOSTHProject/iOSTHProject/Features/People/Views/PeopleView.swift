//
//  PeopleView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/17/24.
//

import SwiftUI

struct PeopleView: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    @StateObject private var vm = PeopleViewModel()
    @State private var showCreate: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(vm.users, id: \.id) { user in
                            NavigationLink {
                                DetailView(userId: user.id)
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
                vm.fetchUsers()

            }
            .sheet(isPresented: $showCreate, content: {
                CreateView()
            })
            .alert(isPresented: $vm.hasError, error: vm.error) {
                Button("Retry") {
                    vm.fetchUsers()
                }
            }
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
