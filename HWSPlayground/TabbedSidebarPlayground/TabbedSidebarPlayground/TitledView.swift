//
//  TitledView.swift
//  TabbedSidebarPlayground
//
//  Created by Thomas Cowern on 5/31/24.
//

import Foundation
import SwiftUI

struct TitledView {
    let title: String
    let icon: Image
    let view: AnyView
    
    init<T: View>(title: String, systemImage: String, view: T) {
        self.title = title
        self.icon = Image(systemName: systemImage)
        self.view = AnyView(view)
    }
}
