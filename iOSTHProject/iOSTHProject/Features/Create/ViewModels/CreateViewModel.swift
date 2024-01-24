//
//  CreateViewModel.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/22/24.
//

import Foundation

final class CreateViewModel: ObservableObject {
    
    @Published private(set) var error: FormError?
    @Published var hasError: Bool = false
    @Published var success: Bool = false
    @Published var person = NewPerson()
    @Published private(set) var state: SubmissionState?
    
    private let validator = CreateValidator()
    
    @MainActor
    func createPerson() async {
        
        do {
            try validator.validate(person)
            
            state = .submitting
            
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            let data = try? encoder.encode(person)
            
            NetworkingManager.shared.request(methodType: .POST(data: data), "https://reqres.in/api/users") { [weak self] res in
                DispatchQueue.main.async {
                    switch res {
                    case .success():
                        print("Success creating user")
                        self?.state = .successful
                    case .failure(let error):
                        self?.state = .unsuccessful
                        self?.hasError = true
                        if let networkingError = error as? NetworkingManager.NetworkingError {
                            self?.error = .networkingError(error: networkingError)
                        }
                        
//                        Could also be done this way:
//                        self?.error = .networkingError(error: error as! NetworkingManager.NetworkingError)
                        
                        print("Error in createPerson: \(error.localizedDescription)")
                        break
                    }
                }
            }
        } catch {
            self.hasError = true
            if let validationError = error as? CreateValidator.CreateValidatorError {
                self.error = .validationError(error: validationError)
            }
            print("Error in validator: \(error.localizedDescription)")
        }
    }
}

extension CreateViewModel {
    enum SubmissionState {
        case successful
        case unsuccessful
        case submitting
    }
}

extension CreateViewModel {
    enum FormError: LocalizedError {
        case networkingError(error: LocalizedError)
        case validationError(error: LocalizedError)
    }
}

extension CreateViewModel.FormError {
    var errorDescription: String? {
        switch self {
        case .networkingError(let error),
                .validationError(let error):
            return error.errorDescription
        }
    }
}
