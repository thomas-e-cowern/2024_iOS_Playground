//
//  StaticJsonDecoder.swift
//  StaticPreviewsPlayground
//
//  Created by Thomas Cowern on 2/24/24.
//

import Foundation

class StaticJsonDecoder {
    static func load<T: Codable>(name: String) -> [T] {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let results = try JSONDecoder().decode([T].self, from: data)
                return results
            } catch {
                return []
            }
        }
        
        return []
    }
}
