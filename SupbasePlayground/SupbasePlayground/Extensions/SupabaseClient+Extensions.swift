//
//  SupabaseClient+Extensions.swift
//  SupbasePlayground
//
//  Created by Thomas Cowern on 7/17/24.
//

import Foundation
import SwiftUI
import Supabase

extension SupabaseClient {
    static var development: SupabaseClient {
        SupabaseClient(supabaseURL: URL(string: "")!, supabaseKey: "")
    }
}
