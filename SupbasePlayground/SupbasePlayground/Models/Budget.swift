//
//  Budget.swift
//  SupbasePlayground
//
//  Created by Thomas Cowern on 7/23/24.
//

import Foundation

struct Budget: Decodable, Identifiable {
    var id: Int?
    var name: String
    var limit: Float
}
