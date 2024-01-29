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
            let data = try encoder.encode(person)
            
            try await NetworkingManager.shared.request(.create(data: data))
            
            state = .successful
        } catch {
            
            self.hasError = true
            
            switch error {
            case is NetworkingManager.NetworkingError:
                self.error = .networkingError(error: error as! NetworkingManager.NetworkingError)
            case is CreateValidator.CreateValidatorError:
                self.error = .validationError(error: error as! CreateValidator.CreateValidatorError)
            default:
                self.error = .system(error: error)
            }
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
        case system(error: Error)
    }
}

extension CreateViewModel.FormError {
    var errorDescription: String? {
        switch self {
        case .networkingError(let error),
                .validationError(let error):
            return error.errorDescription
        case .system(let error):
            return error.localizedDescription
        }
    }
}
