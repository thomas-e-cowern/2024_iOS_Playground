//
//  DetailView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/18/24.
//

import SwiftUI

struct DetailView: View {
    
    @State private var userInfo: UserDetailResponse?
    
    var body: some View {
        ZStack {
            
            background
            
            VStack(alignment: .leading, spacing: 18) {
                
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
        .onAppear {
            do {
                userInfo = try StaticJSONMapper.decode(file: "SingleUserData", type: UserDetailResponse.self)
            } catch {
            // TODO: Handle errors
                print("Error in detail view onAppear: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    DetailView()
}

private extension DetailView {
    
    var background: some View {
        Theme.background
    }
    
    @ViewBuilder
    var link: some View {
        
        if let supportString = userInfo?.support.url,
           let supportUrl = URL(string: supportString),
           let supportText = userInfo?.support.text {
            
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
            PillView(id: userInfo?.data.id ?? 0)
            
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
        
        Text(userInfo?.data.firstName ?? "-")
            .font(.system(.subheadline, design: .rounded))
        
        Divider()
    }
    
    @ViewBuilder
    var lastName: some View {
        Text("Last Name")
            .font(.system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text(userInfo?.data.lastName ?? "-")
            .font(.system(.subheadline, design: .rounded))
        
        Divider()
    }
    
    @ViewBuilder
    var email: some View {
        Text("Email")
            .font(.system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text(userInfo?.data.email ?? "-")
            .font(.system(.subheadline, design: .rounded))
    }
}
