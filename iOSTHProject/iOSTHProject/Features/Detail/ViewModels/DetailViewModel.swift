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
    
    func fetchDetail(for id: Int) {
        isLoading = true
        NetworkingManager.shared.request(.detail(id: id), type: UserDetailResponse.self) { res in
            DispatchQueue.main.async {
                defer { self.isLoading = false }
                switch res {
                case.success(let response):
                    self.userInfo = response
                case .failure(let error):
                    print(error.localizedDescription)
                    self.hasError = true
                    self.error = error as? NetworkingManager.NetworkingError
                }
            }
        }
    }
}
