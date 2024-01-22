//
//  PeopleViewModel.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/22/24.
//

import Foundation

final class PeopleViewModel: ObservableObject {
    @Published private(set) var users: [User] = []
    
    func fetchUsers() {
        NetworkingManager.shared.request("https://reqres.in/api/users", type: UsersResponse.self) { res in
            DispatchQueue.main.async {
                switch res {
                case.success(let response):
                    self.users = response.data
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
