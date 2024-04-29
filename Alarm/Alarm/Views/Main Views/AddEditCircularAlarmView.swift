//
//  AddEditCircularAlarmView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/29/24.
//

import SwiftUI

struct AddEditCircularAlarmView: View {
    
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                CancelSaveAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
                
                AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)
                
                Divider()
                Spacer()
                
                CircularTimeView(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel, size: geo.size.width / 2)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    AddEditCircularAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
}
