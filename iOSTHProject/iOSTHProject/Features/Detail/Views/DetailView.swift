//
//  DetailView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/18/24.
//

import SwiftUI

struct DetailView: View {
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
    }
}

#Preview {
    DetailView()
}

private extension DetailView {
    
    var background: some View {
        Theme.background
    }
    
    var link: some View {
        Link(destination: URL(string: "https://regres.in/#support-heading")!, label: {
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Support Regres")
                    .foregroundStyle(Theme.text)
                    .font(.system(.body, design: .rounded)
                        .weight(.semibold)
                    )
                
                Text("https://regres.in/#support-heading")
            })
            
            Spacer()
            
            Symbols.link
                .font(.system(.title3, design: .rounded))
        })

    }
}

private extension DetailView {
    
    var general: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            PillView(id: 0)
            
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
        
        Text("<first name here>")
            .font(.system(.subheadline, design: .rounded))
        
        Divider()
    }
    
    @ViewBuilder
    var lastName: some View {
        Text("Last Name")
            .font(.system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text("<last name here>")
            .font(.system(.subheadline, design: .rounded))
        
        Divider()
    }
    
    @ViewBuilder
    var email: some View {
        Text("Email")
            .font(.system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text("<email here>")
            .font(.system(.subheadline, design: .rounded))
    }
}
