//
//  GlobalErrorsApp.swift
//  GlobalErrors
//
//  Created by Thomas Cowern on 1/29/24.
//

import SwiftUI

@main
struct GlobalErrorsApp: App {
    
    @StateObject private var errorState = ErrorState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(errorState)
                .sheet(item: $errorState.errorWrapper) { errorWrapper in
                    ErrorView(errorWrapper: errorWrapper)
                }
        }
    }
}
