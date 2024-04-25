//
//  CancelSaveAlarmView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/25/24.
//

import SwiftUI

struct CancelSaveAlarmView: View {
    
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    
    var body: some View {
        HStack {
            Button(action: {
                print("Cancel")
            }, label: {
                Text("Cancel")
            })
            
            Spacer()
            
            Button(action: {
                print("Save")
                if let currentAlarmIndex = currentAlarmIndex {
                    // MARK: TODO - Edit alarm to view model
                    print("\(currentAlarmIndex)")
                } else {
                    // MARK: TODO - Append alarm to view model
                }
            }, label: {
                Text("Save")
            })
        }
    }
}

#Preview {
    CancelSaveAlarmView(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()))
}
