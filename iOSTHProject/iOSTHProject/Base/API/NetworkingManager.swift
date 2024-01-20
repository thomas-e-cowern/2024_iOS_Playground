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
    
    func request(_ absoluteURL: String) {
        let url = URL(string: absoluteURL)
        let request = URLRequest(url: url!)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if (error != nil) {
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let res = try decoder.decode(UsersResponse.self, from: data)
            } catch {
                print("Error in networking manager: \(error.localizedDescription)")
            }
        }
        
        dataTask.resume()
    }
}
