//
//  UserDetailReponse.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/17/24.
//

import Foundation

// MARK: - UserDetailResponse
struct UserDetailResponse: Codable, Equatable {
    let data: User
    let support: Support
}
