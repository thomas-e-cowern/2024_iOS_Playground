//
//  StandardError.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/12/24.
//

import Foundation

enum StandardError: Error, LocalizedError {
    case unknown
    var errorDescription: String? {
        "Unknown Error Occurred"
    }
}
