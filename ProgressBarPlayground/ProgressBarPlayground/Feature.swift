//
//  Feature.swift
//  ProgressBarPlayground
//
//  Created by Thomas Cowern on 3/7/24.
//

import Foundation

struct Feature: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var endOnboarding: Bool
}
