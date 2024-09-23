//
//  Comment.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/23/24.
//

import Foundation

struct Comment: Codable, Identifiable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
