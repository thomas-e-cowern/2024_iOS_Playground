//
//  ViewStateErrorView.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/12/24.
//

import SwiftUI

struct ViewStateErrorView: View {
    
    let message: String
    let retry: (() -> Void)?
    
    var body: some View {
        ContentUnavailableView {
            Image(systemName: "xmark.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(.red)
        } description: {
            Text(message)
                .bold()
        } actions: {
            if let retry {
                Button("Retry") { retry() }
                    .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    ViewStateErrorView(message: "Simulator error message", retry: nil)
}
