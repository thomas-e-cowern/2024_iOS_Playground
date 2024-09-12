//
//  ShowView.swift
//  ShortDurationView
//
//  Created by Thomas Cowern on 9/12/24.
//

import Foundation
import SwiftUI

struct ShowView: ViewModifier {
    
    let duration: Duration
    @Binding var isVisible: Bool
    
    func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 1 : 0)
            .task {
                try? await Task.sleep(for: duration)
                
                withAnimation {
                    isVisible = false
                }
            }
    }
}

extension View {
    func show(duration: Duration, isVisible: Binding<Bool>) -> some View {
        modifier(ShowView(duration: duration, isVisible: isVisible))
    }
}
