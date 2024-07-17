//
//  SupabaseEnvironmentValues.swift
//  SupbasePlayground
//
//  Created by Thomas Cowern on 7/17/24.
//

import Foundation
import SwiftUI
import Supabase

struct SupabaseEnvironmentValues: EnvironmentKey {
    static var defaultValue: SupabaseClient = .development
}

extension EnvironmentValues {
    var supabaseClient: SupabaseClient {
        get { self[SupabaseEnvironmentValues.self] }
        set { self[SupabaseEnvironmentValues.self] = newValue }
    }
}
