//
//  Supabase.swift
//  SupbasePlayground
//
//  Created by Thomas Cowern on 7/8/24.
//

import Foundation
import Supabase

let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "Nothing there"

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://xwtkxisitnsrfuqvpbld.supabase.co")!,
  supabaseKey: apiKey
)
