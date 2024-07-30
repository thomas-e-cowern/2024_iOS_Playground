//
//  WeatherCustomStyle.swift
//  GroupBoxPlayground
//
//  Created by Thomas Cowern on 7/30/24.
//

import Foundation
import SwiftUI

struct WeatherCustomStyle: GroupBoxStyle {
    
    var backgroundImage : Image
    
    @State private var moveUp = false
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .font(.system(size: 80))
                .padding(.bottom, 4)
                .foregroundStyle(.white)
                .offset(y: moveUp ? -5 : 5)
                .animation(.easeInOut(duration: 1), value: moveUp)
                .onAppear {
                    moveUp.toggle()
                }
            configuration.content
                .padding()
                .font(.system(size: 20))
                .background(.blue.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(width: 300)
                .foregroundStyle(.white)
        
        }
        .padding()
        .background(
            backgroundImage.resizable()
                .scaledToFill()
        )
        .overlay(Color.black.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
    }
    
}
