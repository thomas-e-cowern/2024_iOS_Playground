//
//  SignedInHomeView.swift
//  UITestingBootcamp
//
//  Created by Thomas Cowern on 8/30/24.
//

import SwiftUI

struct SignedInHomeView: View {
    
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Signed In Home View")
                    .foregroundStyle(Color.white)
                
                Button("Show welcome message") {
                    showAlert.toggle()
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .alert("Welcome", isPresented: $showAlert) {
                    // Something happens here
                }
                
                NavigationLink("Destination") {
                    Text("Destination Arrived")
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.white)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            } //: End of VStack
            .padding()
            .navigationTitle("Welcome")
        }
    }
}

#Preview {
    SignedInHomeView()
}
