//
//  MainAlarmView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/22/24.
//

import SwiftUI

struct MainAlarmView: View {
    
    var body: some View {
        
        ZStack {
            
            backgroundColor
                .ignoresSafeArea()
            
            TabView {
                AlarmListView(alarmViewModels: AlarmModel.DummyAlarmData())
                    .tabItem {
                        Label("Alarms", systemImage: "alarm.fill")
                    }
                
                AboutView()
                    .tabItem {
                        Label("About", systemImage: "info.circle.fill")
                    }
            }
        }
    }
}

#Preview {
    MainAlarmView()
}
