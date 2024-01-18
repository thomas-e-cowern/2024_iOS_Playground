//
//  PersonItemView.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/17/24.
//

import SwiftUI

struct PersonItemView: View {
    
    let user: User
    
    var body: some View {
        VStack(spacing: .zero) {
            Rectangle()
                .fill(.blue)
                .frame(height: 130)
            VStack(alignment: .leading) {
                
                PillView(id: user.id)
                
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

//#Preview {
//    PersonItemView(user: )
//        .frame(width: 250)
//}
