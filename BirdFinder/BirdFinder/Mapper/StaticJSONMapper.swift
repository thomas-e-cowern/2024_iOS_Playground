//
//  StaticJSONMapper.swift
//  BirdFinder
//
//  Created by Thomas Cowern on 3/5/24.
//

import Foundation

struct StaticJSONMapper {
    static func decode<T: Decodable>(file: String, type: T.Type) throws -> T {
        guard !file.isEmpty,
              let path = Bundle.main.path(forResource: file, ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            throw MappingError.failedToGetContents
        }

        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
}

extension StaticJSONMapper {
    enum MappingError: Error {
        case failedToGetContents
    }
}
