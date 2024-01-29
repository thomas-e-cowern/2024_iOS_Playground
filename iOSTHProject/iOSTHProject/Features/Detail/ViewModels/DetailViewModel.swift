//
//  DetailViewModel.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/22/24.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published private(set) var userInfo: UserDetailResponse?
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError: Bool = false
    @Published private(set) var isLoading: Bool = false
    
    @MainActor
    func fetchDetail(for id: Int) async {
        
        isLoading = true
        defer { self.isLoading = false }
        
        do {
            self.userInfo = try await NetworkingManager.shared.request(.detail(id: id), type: UserDetailResponse.self)
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
