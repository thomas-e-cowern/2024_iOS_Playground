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
    
    func fetchDetail(for id: Int) {
        NetworkingManager.shared.request("https://reqres.in/api/users/\(id)", type: UserDetailResponse.self) { res in
            DispatchQueue.main.async {
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
