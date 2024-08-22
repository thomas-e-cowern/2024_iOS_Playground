//
//  PersonalInfoView.swift
//  MultistepFormPlayground
//
//  Created by Thomas Cowern on 8/22/24.
//

import SwiftUI

struct PersonalInfoView: View {
    
    @Binding var personal: Personal
    
    var body: some View {
        Form {
            TextField("Enter First Name", text: $personal.firstName)
            TextField("Enter Last Name", text: $personal.lasstName)
        }
    }
}

#Preview {
    PersonalInfoView(personal: .constant(Personal()))
}
