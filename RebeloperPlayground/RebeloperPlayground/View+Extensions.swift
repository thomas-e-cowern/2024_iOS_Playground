//
//  View+Extensions.swift
//  RebeloperPlayground
//
//  Created by Thomas Cowern on 10/22/24.
//

import SwiftUI

extension View {
    
    func navigationLinkValues<D>(_ data: D.Type) -> some View where D : Hashable & View {
        NavigationStack {
            self.navigationDestination(for: data, destination: { $0 })
        }
    }
    
}
