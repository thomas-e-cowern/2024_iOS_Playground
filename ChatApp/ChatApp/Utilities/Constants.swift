//
//  Constants.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/21/24.
//

import Foundation

struct Constants {
    static let baseUrlPath = "https://jsonplaceholder.typicode.com"
    
    struct Urls {
        
        static let posts = URL(string: "\(baseUrlPath)/posts")!
    }
}
