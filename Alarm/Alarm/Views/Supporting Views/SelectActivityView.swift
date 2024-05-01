//
//  SelectActivityView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/26/24.
//

import SwiftUI

struct SelectActivityView: View {
    
    @Binding var currentColorIndex: Int
    @Binding var currentActivity: String
    
    var currentColor: Color {
        mainColors[currentColorIndex]
    }
    
    var nextIndex: Int {
        (currentColorIndex + 1) % mainColors.count
    }
    
    var body: some View {
        HStack (spacing: 10) {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(activities, id: \.self) { activity in
                        
                        let isSeletedActivity = activity == currentActivity
                        Image(systemName: activity)
                            .font(isSeletedActivity ? .largeTitle : .subheadline)
                            .foregroundStyle(isSeletedActivity ? currentColor : nickel)
                            .opacity(isSeletedActivity ? 1.0 : 0.7)
                            .onTapGesture {
                                withAnimation {
                                    currentActivity = activity
                                    print("Activity selected: \(activity)")
                                }
                            }
                
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            Circle()
                .fill(currentColor)
                .frame(width: 20, height: 20)
                .shadow(
                    color: currentColor,
                    radius: 10,
                    x: 0,
                    y: 5
                )
                .overlay(content: {
                    Circle()
                    .stroke(lineWidth: 3)
                })
                .onTapGesture {
                    currentColorIndex = nextIndex
                }
        }
        .padding(5)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(nickel, lineWidth: 1)
        }
    }
}

#Preview {
    SelectActivityView(currentColorIndex: .constant(0), currentActivity: .constant(activities[1]))
}
