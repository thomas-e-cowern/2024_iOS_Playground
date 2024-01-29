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
    @State private var showSuccess: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                if vm.isLoading {
                    ProgressView()
                } else {
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
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    create
                }
            }
            .task {
                await vm.fetchUsers()
            }
            .sheet(isPresented: $showCreate, content: {
                CreateView(successfulAction: {
                    haptic(.success)
                    withAnimation(.spring().delay(0.50)) {
                        self.showSuccess.toggle()
                    }
                })
            })
            .alert(isPresented: $vm.hasError, error: vm.error) {
                Button("Retry") {
                    Task {
                        await vm.fetchUsers()
                    }
                }
            }
            .overlay {
                if showSuccess {
                    CheckmarkPopoverVIew()
                        .transition(.scale.combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                withAnimation {
                                    self.showSuccess.toggle()
                                }
                            }
                        }
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
        .disabled(vm.isLoading)
    }
    
    var background: some View {
        Theme.background
    }
}
