//
//  MyTextField.swift
//  SwiftUICampOct2024
//
//  Created by Thomas Cowern on 10/16/24.
//

import SwiftUI

public struct MyTextField: View {
    
    @Binding var name: String
    
    public var body: some View {
        TextField("Enter your name", text: $name)
            .textFieldStyle(.roundedBorder)
    }
}
