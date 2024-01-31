//
//  CurrentDate.swift
//  ASAsynchAwaitTimeApp
//
//  Created by Thomas Cowern on 1/31/24.
//

import Foundation
import SwiftUI

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
