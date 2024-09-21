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
        
        static let user = URL(string: "\(baseUrlPath)/users/id")
        
        static func getUserInfo(id: Int) -> URL {
            URL(string: "\(baseUrlPath)/users/\(id)")!
        }
    }
}
