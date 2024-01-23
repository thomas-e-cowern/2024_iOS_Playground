//
//  DetailView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/18/24.
//

import SwiftUI

struct DetailView: View {
    
    let userId: Int
    @StateObject private var vm = DetailViewModel()
    
    var body: some View {
        ZStack {
            
            background
            
            if vm.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        
                        avatar
                        
                        Group {
                            general
                            link
                        }
                        .padding(.horizontal, 9)
                        .padding(.vertical, 10)
                        .background(Theme.detailBackground, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                        
                        
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Details")
        .onAppear {
            vm.fetchDetail(for: userId)
        }
        .alert(isPresented: $vm.hasError, error: vm.error) {
            Button("Retry") {
                // Do nothing
            }
        }
    }
}

#Preview {
    
    var previewUserId: Int {
        let users = try! StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
        
        return users.data.first?.id ?? 3
    }
    
    return NavigationStack {
       DetailView(userId: previewUserId)
    }
}

private extension DetailView {
    
    var background: some View {
        Theme.background
    }
    
    @ViewBuilder
    var avatar: some View {
        if let userAvatar = vm.userInfo?.data.avatar, let avatarUrl = URL(string: userAvatar) {
            AsyncImage(url: avatarUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }
    
    @ViewBuilder
    var link: some View {
        
        if let supportString = vm.userInfo?.support.url,
           let supportUrl = URL(string: supportString),
           let supportText = vm.userInfo?.support.text {
            
            Link(destination: supportUrl, label: {
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text(supportText)
                        .foregroundStyle(Theme.text)
                        .font(.system(.body, design: .rounded)
                            .weight(.semibold)
                        )
                        .multilineTextAlignment(.leading)
                    
                    Text(supportString)
                })
                
                Spacer()
                
                Symbols.link
                    .font(.system(.title3, design: .rounded))
            })
        }
    }
}

private extension DetailView {
    
    var general: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            PillView(id: vm.userInfo?.data.id ?? 0)
            
            Group {
                firstName
                lastName
                email
            }
            .foregroundStyle(Theme.text)
        })
        
    }
    
    @ViewBuilder
    var firstName: some View {
        Text("First Name")
            .font(.system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text(vm.userInfo?.data.firstName ?? "-")
            .font(.system(.subheadline, design: .rounded))
        
        Divider()
    }
    
    @ViewBuilder
    var lastName: some View {
        Text("Last Name")
            .font(.system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text(vm.userInfo?.data.lastName ?? "-")
            .font(.system(.subheadline, design: .rounded))
        
        Divider()
    }
    
    @ViewBuilder
    var email: some View {
        Text("Email")
            .font(.system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text(vm.userInfo?.data.email ?? "-")
            .font(.system(.subheadline, design: .rounded))
    }
}
