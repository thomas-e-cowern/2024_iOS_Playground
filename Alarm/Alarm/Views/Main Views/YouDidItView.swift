//
//  YouDidItView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/25/24.
//

import SwiftUI

struct YouDidItView: View {
    var body: some View {
        
        let youDidIt: LocalizedStringKey = "you did it! here you can manage your alarm, change time and other things"
        
        GeometryReader { geo in
            ZStack {
                
                MainGradientView(endRadius: 120, scaleX: 1.5, yellowColor: darkYellow)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(height: geo.size.height / 4)
                    .overlay(
                        HStack {
                            CoolTextView(text: youDidIt, size: 18)
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.leading)
                            .frame(width: geo.size.width / 1.8)
                            
                            Spacer()
                            
                            Image(beachImage)
                                .resizable()
                                .scaledToFit()
                        }
                        
                    )
                    .padding()
            }
        }
    }
}

#Preview {
    YouDidItView()
}
