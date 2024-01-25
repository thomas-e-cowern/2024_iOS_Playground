//
//  PeopleViewModel.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/22/24.
//

import Foundation

final class PeopleViewModel: ObservableObject {
    @Published private(set) var users: [User] = []
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError: Bool = false
    @Published private(set) var isLoading: Bool = false
    
    func fetchUsers() {
        isLoading = true
        NetworkingManager.shared.request(.people, type: UsersResponse.self) { res in
            DispatchQueue.main.async {
                defer { self.isLoading = false }
                switch res {
                case.success(let response):
                    self.users = response.data
                case .failure(let error):
                    self.hasError = true
                    self.error = error as? NetworkingManager.NetworkingError
                    print(error.localizedDescription)
                }
            }
        }
    }
}
