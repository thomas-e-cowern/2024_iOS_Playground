//
//  GradientContentView.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/13/24.
//

import SwiftUI

struct GradientContentView: View {
    var body: some View {
        ScrollView {
            Rectangle()
//                .fill(.blue.gradient)
                .foregroundStyle(.blue.gradient)
                .frame(height: 100, alignment: .center)
            
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.white, .blue, .black]), startPoint: .top, endPoint: .bottom)
                )
                .frame(height: 100, alignment: .center)
            
            Circle()
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.red, .green, .blue, .purple, .yellow, .orange]), center: .center)
                )
                .frame(height: 300, alignment: .center)
            
            Circle()
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.red, .green, .blue, .purple, .yellow, .orange]), center: .center, startAngle: .zero, endAngle: .degrees(180))
                )
                .frame(height: 300, alignment: .center)
        }
    }
}

#Preview {
    GradientContentView()
}
