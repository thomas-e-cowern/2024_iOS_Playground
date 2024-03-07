//
//  ProgressBar.swift
//  ProgressBarPlayground
//
//  Created by Thomas Cowern on 3/7/24.
//

import SwiftUI

struct ProgressBar: View {
    
    var width: CGFloat = 200
    var heigt: CGFloat = 20
    var percent: CGFloat = 69
    
    var body: some View {
        
        let multiplier = width / 100
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: width, height: 20)
                .foregroundStyle(.black.opacity(0.1))
            RoundedRectangle(cornerRadius: heigt, style: .continuous)
                .frame(width: percent * multiplier, height: heigt)
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    ProgressBar()
}
