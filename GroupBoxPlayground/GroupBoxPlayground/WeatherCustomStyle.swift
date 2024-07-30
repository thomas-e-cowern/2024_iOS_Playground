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
    
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .font(.system(size: 80))
                .padding(.bottom, 4)
                .foregroundStyle(.white)
            configuration.content
                .padding()
                .font(.system(size: 20))
                .background(.white.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(width: 300)
                .foregroundStyle(.white)
        
        }
        .padding()
        .background(
            backgroundImage.resizable()
                .scaledToFit()
        )
        .overlay(Color.black.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
    }
    
}
