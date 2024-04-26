//
//  TheToggleView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/26/24.
//

import SwiftUI

struct TheToggleView: View {
    
    var width: Double = 35.0
    let factor: Double = 59.0 / 35.0
    let innerCircleFactor: Double = 59.0 / 25.0
    let offsetDelta: Double = 12.0
    
    @Binding var isOn: Bool
    
    var sign: Double {
        isOn ? 1.0 : -1.0
    }
    
    var xShift: Double {
        return sign * offsetDelta
    }
    
    // background color should return a value between 0.5 and 1
    var backgroundColor: Double {
        var result = xShift + offsetDelta
        result = result / (2 * offsetDelta)
        result = result * 0.5
        result = 0.5 - result
        return result
    }
    
    var textColor: Color {
        isOn ? lightGray : black
    }
    
    var onOffText: LocalizedStringKey {
        isOn ? "on" : "off"
    }
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { gesture in
                withAnimation(.easeIn(duration: 0.2)) {
                    isOn = gesture.translation.width > 0 ? true : false
                }
            }
        
        let tapGesture = TapGesture()
            .onEnded { _ in
                withAnimation(.easeIn(duration: 0.2)) {
                    isOn.toggle()
                }
            }
        
        let combinedGesture = dragGesture.simultaneously(with: tapGesture)
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    Color(white: backgroundColor)
                )
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview("Toggle true") {
    TheToggleView(isOn: .constant(true))
}

#Preview("Toggle false") {
    TheToggleView(isOn: .constant(false))
}
