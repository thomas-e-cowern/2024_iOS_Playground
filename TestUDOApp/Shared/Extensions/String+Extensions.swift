//
//  String+Extensions.swift
//  TestUDOApp
//
//  Created by Thomas Cowern on 6/26/24.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpaces: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
