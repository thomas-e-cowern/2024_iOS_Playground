//
//  DestinationView.swift
//  NavigationAnimationsPlayground
//
//  Created by Thomas Cowern on 10/21/24.
//

import SwiftUI

struct DestinationView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Color.teal.frame(height: 200)
                .overlay {
                    Image(systemName: "swift")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundStyle(.thinMaterial)
                }
            }
        }
    }
}

#Preview {
    DestinationView()
}
