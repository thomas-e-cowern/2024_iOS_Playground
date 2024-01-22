//
//  CreateViewModel.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/22/24.
//

import Foundation

final class CreateViewModel: ObservableObject {
    
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
                    self?.state = .successful
                case .failure(let error):
                    self?.state = .unsuccessful
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
