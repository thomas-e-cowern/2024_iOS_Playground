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
            ZStack {
                List {
                    ForEach(alarmViewModels) { alarm in
                        HStack {
                            NavigationLink {
                                AddEditAlarmView(currentAlarmIndex: Int(alarm.id), alarmModel: alarm)
                            } label: {
                                AlarmRowView(model: alarm)
                            }
                        }
                    }
                }
                .navigationTitle("Alarm List")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            AddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
                        } label: {
                            Text("+")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                        }

                    }
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
            }
            }
        }
    }
}

#Preview {
    AlarmListView(alarmViewModels: AlarmModel.DummyAlarmData())
}
