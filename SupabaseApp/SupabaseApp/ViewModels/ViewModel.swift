//
//  ViewModel.swift
//  SupabaseApp
//
//  Created by Thomas Cowern on 7/9/24.
//

import Foundation
import Supabase

enum Table {
    static let features = "Features"
}

enum AuthAction: String, CaseIterable {
    case signUp = "Sign Up"
    case signIn = "Sign In"
}

final class ViewModel: ObservableObject {
    
    @Published var isAuthenticated = false
    @Published var authAction: AuthAction = .signUp
    
    @Published var features = [Feature]()
    
    @Published var showingAuthView = false
    @Published var email = ""
    @Published var password = ""
    
    let supabase = SupabaseClient(supabaseURL: Secrets.projectURL, supabaseKey: Secrets.apiKey)
    
    
    // MARK: - Database
    
    func createFeatureRequest(text: String) async throws {
        let user = try await supabase.auth.session.user
        
        let feature = Feature(createdAt: Date(), text: text, isComplete: false, userID: user.id)
        
        try await supabase.from("Features").insert(feature).execute()
    }
    
    func fetchFeatureRequests() async throws {
        let features: [Feature] = try await supabase.from("Features").select().order("created_at", ascending: false).execute().value
        
        DispatchQueue.main.async {
            self.features = features
        }
    }
    
    func update(_ feature: Feature, with text: String) async {
        guard let id = feature.id else {
            print("Can't update feature")
            return
        }
        
        var toUpdate = feature
        toUpdate.text = text
        
        do {
            try await supabase.from("Features").update(toUpdate).eq("id", value: id).execute()
        } catch {
            print("Error updating: \(error.localizedDescription)")
        }
    }
    
    func deleteFeature(at id: Int) async throws {
    }
    
    // MARK: - Authentication
    
    func signUp() async throws {
        let response = try await supabase.auth.signUp(email: email, password: password)
    }
    
    func signIn() async throws {
        let session = try await supabase.auth.signIn(email: email, password: password)
    }
    
    func isUserAuthenticated() async {
        do {
            _ = try await supabase.auth.session.user
            isAuthenticated = true
        } catch {
            isAuthenticated = false
        }
    }
    
    func signOut() async throws {
        try await supabase.auth.signOut()
        isAuthenticated = false
    }
    
    func authorize() async throws {
        switch authAction {
        case .signUp:
            try await signUp()
        case .signIn:
            try await signIn()
        }
    }
}
