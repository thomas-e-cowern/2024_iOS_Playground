//
//  AddEditAlarmView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/25/24.
//

import SwiftUI

struct AddEditAlarmView: View {
    
    let currentAlarmIndex: Int?
    
    @State var alarmModel: AlarmModel
    @State private var showYouDidItView = true
    
    var body: some View {
        ZStack {
            
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text("you did it! here you can manage your alarm, change time and other things")
                    .padding()
            }
        }
    }
}

#Preview {
    AddEditAlarmView(currentAlarmIndex: 1, alarmModel: .DefaultAlarm())
}
