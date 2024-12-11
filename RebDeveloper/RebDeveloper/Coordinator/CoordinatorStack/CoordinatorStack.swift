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
        }
    }
}
