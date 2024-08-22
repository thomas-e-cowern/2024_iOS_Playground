//
//  AddressView.swift
//  MultistepFormPlayground
//
//  Created by Thomas Cowern on 8/22/24.
//

import SwiftUI

struct AddressView: View {
    
    @Binding var address: Address
    
    var body: some View {
        VStack {
            Form {
                TextField("Enter Address", text: $address.address)
                TextField("Enter Additional Address", text: $address.address2)
                TextField("Enter Town", text: $address.town)
                TextField("Enter State", text: $address.state)
                TextField("Enter Zipcode", text: $address.zipCode)
            }
        }
    }
}

#Preview {
    AddressView(address: .constant(Address()))
}
