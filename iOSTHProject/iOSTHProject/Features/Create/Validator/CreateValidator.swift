//
//  CreateValidator.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/24/24.
//

import Foundation

struct CreateValidator {
    
    func validate(_ person: NewPerson) throws {
        
    }
}

extension CreateValidator {
    enum CreateValidatorError: LocalizedError {
        case invalidFirstName
        case invalidLastName
        case invalidJob
    }
}

extension CreateValidator.CreateValidatorError {
    var errorDescription: String? {
        switch self {
        case .invalidFirstName:
            return "First name can't be empty"
        case .invalidLastName:
            return "Last name can't be emtpy"
        case .invalidJob:
            return "Job can't be emtpy"
        }
    }
}
