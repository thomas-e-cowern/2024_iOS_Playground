//
//  ChatGPTService.swift
//  TestUDOApp
//
//  Created by Thomas Cowern on 6/27/24.
//

import Foundation

struct ChatGPTService {
    private let endpoint = "https://inquisitive-ivory-shampoo.glitch.me/api/chat" // Replace with your backend URL
    
    func sendMessage(_ message: String, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "prompt": message
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let responseText = json["response"] as? String {
                completion(responseText)
            } else {
                completion(nil)
            }
        }.resume()
    }
}

