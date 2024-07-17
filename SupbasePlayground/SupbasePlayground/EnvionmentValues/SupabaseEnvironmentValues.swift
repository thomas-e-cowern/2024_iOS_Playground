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
    static var defaultValue: SupabaseClient = SupabaseClient(supabaseURL: <#T##URL#>, supabaseKey: <#T##String#>)
}
