//
//  CoordinatorStack.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/11/24.
//

import SwiftUI

struct CoordinatorStack<CoordinatorPage: Coordinatable>: View {    
    var body: some View {
        coordinator?.fullScreenCover() ?? EmptyView()
    }
}
