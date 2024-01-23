//
//  CreateViewModel.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/22/24.
//

import Foundation

final class CreateViewModel: ObservableObject {
    
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError: Bool = false
    @Published var success: Bool = false
    @Published var person = NewPerson()
    @Published private(set) var state: SubmissionState?
    
    func createPerson() {
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
                    self?.error = error as? NetworkingManager.NetworkingError
                    print("Error in createPerson: \(error.localizedDescription)")
                    break
                }
            }
        }
    }
}

extension CreateViewModel {
    enum SubmissionState {
        case successful
        case unsuccessful
    }
}
