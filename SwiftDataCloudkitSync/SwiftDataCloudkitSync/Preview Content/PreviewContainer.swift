//
//  PreviewContainer.swift
//  SwiftDataCloudkitSync
//
//  Created by Thomas Cowern on 7/29/24.
//



// This provides dummy data for previews

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    
    do {
        let container = try ModelContainer(for: Vegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        SampleData.vegatables.forEach { vegetable in
            container.mainContext.insert(vegetable)
        }
        
        return container
    } catch {
        fatalError("Failed to create container")
    }
    
}()

struct SampleData {
    static let vegatables: [Vegetable] = {
        return [Vegetable(name: "Tomato"), Vegetable(name: "Turnip"), Vegetable(name: "Carrots"), Vegetable(name: "Onion")]
    }()
}
