//
//  PreconditionTest.swift
//  HWSCareerAccelerator
//
//  Created by Thomas Cowern on 10/1/24.
//

import SwiftUI

extension Array {
    subscript(safe idx: Int) -> Element? {
        if idx >= 0 && idx < count {
            return self[idx]
        } else {
            return nil
        }
    }
}

extension Array {
    subscript(idx: Int, default default: Element) -> Element {
        if idx >= 0 && idx < count {
            return self[idx]
        } else {
            return `default`
        }
    }
}


struct PreconditionTest: View {
    
    @State var setName: String = ""
    let names = ["Gary", "Jack", "Quinn"]
    
    var body: some View {
        TextField("Enter your name", text: $setName)
        
        Button("Click to set name") {
            setName(to: setName)
//            if let name = names[safe: 3] {
//                setName = name
//            } else {
//                setName = "Name not found."
//            }
            
            setName = names[3, default: "Anonymous"]
        }
        
        Text("\(setName)")
            
    }
    
    func setName(to newName: String) {
        precondition(newName.isEmpty == false, "Name must not be empty")
        print("Name is now \(newName)")
    }
}

#Preview {
    PreconditionTest()
}
