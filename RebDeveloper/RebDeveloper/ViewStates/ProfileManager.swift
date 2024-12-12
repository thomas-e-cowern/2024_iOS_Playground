//
//  ProfileManager.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/12/24.
//

import Foundation

class ProfileManager {
    
    static var shared: ProfileManager = .init()

    var profiles: [VSProfile] = []
    
    func load() async throws -> [VSProfile] {
        try? await Task.sleep(for: .seconds(2))
        profiles = Self.mock
        return profiles
    }
    
    func loadEmpty() async throws -> [VSProfile] {
        try? await Task.sleep(for: .seconds(2))
        profiles = []
        return profiles
    }
    
    func loadError() async throws -> [VSProfile] {
        try? await Task.sleep(for: .seconds(2))
        throw StandardError.unknown
    }
    
    static var mock: [VSProfile] = [
        VSProfile(id: "1", name: "Ada"),
        VSProfile(id: "2", name: "Bob"),
        VSProfile(id: "3", name: "claire")
    ]
}
