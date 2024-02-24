//
//  Post.swift
//  StaticPreviewsPlayground
//
//  Created by Thomas Cowern on 2/24/24.
//

import Foundation

struct Post: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
