//
//  PreconditionTest.swift
//  HWSCareerAccelerator
//
//  Created by Thomas Cowern on 10/1/24.
//

import SwiftUI

struct PreconditionTest: View {
    
    @State var name: String = ""
    
    var body: some View {
        TextField("Enter your name", text: $name)
        
        Button("Click to set name") {
            setName(to: name)
        }
            
    }
    
    func setName(to newName: String) {
        precondition(newName.isEmpty == false, "Name must not be empty")
        print("Name is now \(newName)")
    }
}

#Preview {
    PreconditionTest()
}
