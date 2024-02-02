//
//  WebService.swift
//  ASAsynchAwaitTimeApp
//
//  Created by Thomas Cowern on 2/2/24.
//

import Foundation

class WebService {
    
    func getDates() async throws -> CurrentDate? {
        guard let url = URL(string: "https://planet-useful-bathroom.glitch.me/current-date") else {
            fatalError("URL is incorrect")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(CurrentDate.self, from: data)
    }
    
}
