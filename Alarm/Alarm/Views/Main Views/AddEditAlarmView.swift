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
                if showYouDidItView {
                    YouDidItView()
                }
                ToBedWakeUpView(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel)
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    showYouDidItView = false
                }
            }
        }
    }
}

#Preview {
    AddEditAlarmView(currentAlarmIndex: 1, alarmModel: .DefaultAlarm())
}
