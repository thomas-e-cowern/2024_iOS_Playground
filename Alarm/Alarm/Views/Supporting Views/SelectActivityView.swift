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
        ScrollView(.horizontal) {
            HStack {
                ForEach(activities, id: \.self) { activity in
                    
                    let isSeletedActivity = activity == currentActivity
                    Image(systemName: activity)
                        .font(isSeletedActivity ? .largeTitle : .subheadline)
                        .foregroundStyle(isSeletedActivity ? currentColor : nickel)
                        .opacity(isSeletedActivity ? 1.0 : 0.7)
                        .onTapGesture {
                            withAnimation {
                                currentActivity = activity
                            }
                        }
            
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SelectActivityView(currentColorIndex: .constant(0), currentActivity: .constant(activities[1]))
}
