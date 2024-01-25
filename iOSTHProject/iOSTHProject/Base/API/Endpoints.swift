//
//  Endpoints.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/25/24.
//

import Foundation

enum Endpoints {
    case people
    case detail(id: Int)
    case create(data: Data?)
}

extension Endpoints {
    enum MethodType {
        case GET
        case POST(data: Data?)
    }
}

extension Endpoints {
    var host: String { "reqres.in" }
    
    var path: String {
        switch self {
        case .people,
                .create:
            return "/api/users"
        case .detail(let id):
            return "/api/users/\(id)"
        }
    }
    
    var methodType: MethodType {
        switch self {
        case .people,
             .detail:
            return .GET
        case .create(let data):
            return .POST(data: data)
        }
    }
}

extension Endpoints {
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        #if DEBUG
        urlComponents.queryItems = [
            URLQueryItem(name: "delay", value: "1")
        ]
        #endif
        
        return urlComponents.url
    }
}
