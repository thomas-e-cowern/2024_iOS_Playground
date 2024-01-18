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
                
                general
                
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
        .padding(.horizontal, 9)
        .padding(.vertical, 10)
        .background(Theme.detailBackground, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
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
