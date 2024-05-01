//
//  MainAddEditAlarmView.swift
//  Alarm
//
//  Created by Thomas Cowern on 5/1/24.
//

import SwiftUI

struct MainAddEditAlarmView: View {
    
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
            AddEditAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel).tag("One")
            AddEditCircularAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel).tag("Two")
        })
        .onAppear() {
            UIPageControl
                .appearance()
                .currentPageIndicatorTintColor = .gray
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
}

#Preview {
    MainAddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
}
