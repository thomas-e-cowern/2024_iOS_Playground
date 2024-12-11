//
//  CoordinatorStack.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/11/24.
//

import SwiftUI

struct CoordinatorStack<CoordinatorPage: Coordinatable>: View {
    
    @State private var coordinator = Coordinator<CoordinatorPage>()
    
    let root: CoordinatorPage
    
    init(root: CoordinatorPage) {
        self.root = root
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            root
                .navigationDestination(for: CoordinatorPage.self) { $0 }
                .sheet(item: $coordinator.sheet) { $0 }
                .fullScreenCover(item: $coordinator.sheet) { $0 }
        }
        .environment(coordinator)
    }
}
