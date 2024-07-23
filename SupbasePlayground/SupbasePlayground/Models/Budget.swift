//
//  Budget.swift
//  SupbasePlayground
//
//  Created by Thomas Cowern on 7/23/24.
//

import Foundation

struct Budget: Codable, Identifiable {
    var id: Int?
    var name: String
    var limit: Float
}
