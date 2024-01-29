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
    
    private var page: Int = 1
    
    @MainActor
    func fetchUsers() async {
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response = try await NetworkingManager.shared.request(.people(page: page), type: UsersResponse.self)
            self.users = response.data
        } catch {
            self.hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }
    
    func hasReachedEnd(of user: User) -> Bool {
        users.last?.id == user.id
    }
    
    @MainActor
    func fetchNextUserPage() async {
        page += 1
        
        do {
            let response = try await NetworkingManager.shared.request(.people(page: page), type: UsersResponse.self)
            self.users += response.data
        } catch {
            self.hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }
}

extension PeopleViewModel {
    enum ViewState {
        case fetching
        case loading
        case finished
    }
}
