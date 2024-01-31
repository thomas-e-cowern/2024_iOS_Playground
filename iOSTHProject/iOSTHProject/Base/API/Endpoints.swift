//
//  Endpoints.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/25/24.
//

import Foundation

enum Endpoints {
    case people(page: Int)
    case detail(id: Int)
    case create(data: Data?)
}

extension Endpoints {
    enum MethodType: Equatable {
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
    
    var queryItems: [String: String]? {
        switch self {
        case .people(let page):
            return ["page": "\(page)"]
        default:
            return nil
        }
    }
}

extension Endpoints {
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        var requestQueryItems = queryItems?.compactMap { item in
            URLQueryItem(name: item.key, value: item.value)
        }
        
        #if DEBUG
        requestQueryItems?.append(URLQueryItem(name: "delay", value: "5"))
        #endif
        
        urlComponents.queryItems = requestQueryItems
        
        return urlComponents.url
    }
}
