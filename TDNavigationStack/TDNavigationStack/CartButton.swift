//
//  CartButton.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/9/24.
//

import SwiftUI

struct CartButton: View {
    
    let count: Int
    let didTap: () -> ()
    
    var body: some View {
        Button {
            didTap()
        } label: {
            Image(systemName: "cart")
                .symbolVariant(.fill)
                .padding(4)
        }
        .overlay(alignment: .topTrailing) {
            if count > 0 {
                badge
            }
        }
    }
}

private extension CartButton {
    
    var badge: some View {
        Text("\(count)")
            .foregroundColor(.white)
            .padding(6)
            .font(.caption2.bold())
            .monospacedDigit()
            .background(
                Circle()
                    .fill(.red)
            )
            .offset(x: 2, y: -2)
    }
}

#Preview("Cart Button no items") {
    return CartButton(count: 0) {
        
    }
    .previewLayout(.sizeThatFits)
    .padding()
}

#Preview("Cart Button 1 item") {
    return CartButton(count: 1) {
        
    }
    .previewLayout(.sizeThatFits)
    .padding()
}
