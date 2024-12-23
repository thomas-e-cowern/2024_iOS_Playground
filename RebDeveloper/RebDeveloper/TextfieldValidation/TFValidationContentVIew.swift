//
//  TFValidationContentVIew.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/23/24.
//

import SwiftUI

struct TFValidationContentVIew: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isFormValid: Bool = false
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                .foregroundColor(Color.black)
                .padding()
            
            SecureField("Password", text: $password)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                .padding()
            
            Button {
                print("\(email) - \(password)")
            } label: {
                Text("Submit")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!isFormValid)
            .padding().onChange(of: email) { _, _ in
                validateForm()
            }
            .padding().onChange(of: password) { _, _ in
                validateForm()
            }
        }
    }
    
    private func validateForm() {
        print(validateEmail())
        print(validatePassword())
        isFormValid = validateEmail() && validatePassword()
    }
    
    private func validateEmail() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,64}$")
        print("isFormValid: \(isFormValid)")
        return emailTest.evaluate(with: email)
    }
    
    private func validatePassword() -> Bool  {
        let test = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$")
        print("isFormValid: \(!isFormValid)")
        return test.evaluate(with: password)
    }
}

#Preview {
    TFValidationContentVIew()
}
