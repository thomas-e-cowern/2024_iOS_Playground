//
//  AlarmRowView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/29/24.
//

import SwiftUI

struct AlarmRowView: View {
    
    let model: AlarmModel
    
    var body: some View {
        HStack {
            Image(systemName: model.activity)
                .foregroundStyle(model.activityColor)
            .font(.title)
            
            VStack(alignment: .leading, content: {
                Text("\(getTimeFromDate(date: model.end))")
                    .font(.title)
                    .fontWeight(model.alarmEnabled ? .regular : .thin)
                    .scaleEffect(model.alarmEnabled ? 1.1 :1.0)
                    .opacity(model.alarmEnabled ? 1.0 : 0.7)
            })
            
            Spacer()
            
            let alarmViewModels = AlarmModel.DummyAlarmData()
            
            TheToggleView(isOn: .constant(alarmViewModels[1].alarmEnabled))
        }
    }
}

#Preview {
    AlarmRowView(model: .DefaultAlarm())
}
