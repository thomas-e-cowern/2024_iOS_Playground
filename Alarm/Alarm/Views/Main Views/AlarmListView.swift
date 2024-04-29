//
//  AlarmListView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/29/24.
//

import SwiftUI

struct AlarmListView: View {
    
    var alarmViewModels: [AlarmModel]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(alarmViewModels) { alarm in
                    HStack {
                        Image(systemName: alarm.activity)
                            .foregroundStyle(alarm.activityColor)
                            .padding(.bottom, 2)
                        Text(alarm.title)
                    }
                }
            }
            .navigationTitle("Alarm List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        Text("Create New Alarm")
                    } label: {
                        Text("+")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }

                }
            }
        }
    }
}

#Preview {
    AlarmListView(alarmViewModels: AlarmModel.DummyAlarmData())
}
