//
//  UITestingBootcampView+Extensions.swift
//  UITestingBootcamp
//
//  Created by Thomas Cowern on 8/30/24.
//

import Foundation
import SwiftUI

extension ContentView {
    var signUpLayer: some View {
        VStack {
            TextField(vm.placeholderTest, text: $vm.textFieldText)
                .font(.headline)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button("Sign Up") {
                withAnimation(.spring()) {
                    vm.signUpButtonPressed()
                }
            }
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
    }
}
