//
//  CircularTimeView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/29/24.
//

import SwiftUI

struct CircularTimeView: View {
    
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    let size: CGFloat
    
    var body: some View {
        VStack(alignment: .center) {
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: size)
                .overlay {
                    Text("Circular Alarm")
                }
        }
    }
}

#Preview {
    CircularTimeView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm(), size: 250)
}
