//
//  ReviewView.swift
//  MultistepFormPlayground
//
//  Created by Thomas Cowern on 8/22/24.
//

import SwiftUI

struct ReviewView: View {
    
    let completedApplication: FEMAApplication
    
    var body: some View {
        VStack {
            Form {
                Section("Personal Info") {
                    Text(completedApplication.personal.firstName)
                    Text(completedApplication.personal.lasstName)
                }
                
                Section("Damage Info") {
                    Text(completedApplication.damage.type.description)
                }
                
                Section("Address Info") {
                    Text(completedApplication.address.address)
                    Text(completedApplication.address.address2)
                    Text(completedApplication.address.town)
                    Text(completedApplication.address.state)
                    Text(completedApplication.address.zipCode)
                }
            }
        }
    }
}

#Preview {
    ReviewView(completedApplication: FEMAApplication())
}
