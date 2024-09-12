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
    @State private var initial: Bool = true
    
    func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 1 : 0)
            .task(id: isVisible) {
                
                if initial {
                    initial = false
                    return
                }
                
                try? await Task.sleep(for: duration)
                guard !Task.isCancelled else { return }
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
