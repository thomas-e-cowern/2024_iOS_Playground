//
//  Message.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/20/24.
//

import Foundation

struct Post: Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
