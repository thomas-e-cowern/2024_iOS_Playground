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
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    PillView(id: 8)
                    
                    firstName
                    
                    lastName
                    
                    email
                }
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
}

private extension DetailView {
    
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
