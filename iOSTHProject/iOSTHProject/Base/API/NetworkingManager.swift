//
//  NetworkingManager.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/20/24.
//

import Foundation

final class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    private init() {
        
    }
    
    func request<T: Codable>(_ endpoint: Endpoints, type: T.Type) async throws -> T {
        
        guard let url = endpoint.url else {
             throw NetworkingError.invalidUrl
        }
        
        let request = buildRequest(from: url, methodType: endpoint.methodType)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkingError.invalidStatusCode(statusCode: statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(T.self, from: data)
        
        return decodedData
    }
    
    func request(_ endpoint: Endpoints) async throws {
        
        guard let url = endpoint.url else {
             throw NetworkingError.invalidUrl
        }
        
        let request = buildRequest(from: url, methodType: endpoint.methodType)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkingError.invalidStatusCode(statusCode: statusCode)
        }
    }
}



extension NetworkingManager {
    enum NetworkingError: LocalizedError {
        case invalidUrl
        case custom(error: Error)
        case invalidStatusCode(statusCode: Int)
        case invalidData
        case faileToDecode(error: Error)
    }
    
    
}

extension NetworkingManager.NetworkingError {
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The URL is invalid"
        case .invalidStatusCode:
            return "Status code falls into the wrong range"
        case .invalidData:
            return "Response data is invalid"
        case .faileToDecode:
            return "Failed to decode data"
        case .custom(let error):
            return "Something went wrong \(error.localizedDescription)"
        }
    }
}

private extension NetworkingManager {
    func buildRequest(from url: URL, methodType: Endpoints.MethodType) -> URLRequest {
        var request = URLRequest(url: url)
        
        switch methodType {
        case .GET:
            request.httpMethod = "GET"
        case .POST(let data):
            request.httpMethod = "POST"
            request.httpBody = data
        }
        
        return request
    }
}
