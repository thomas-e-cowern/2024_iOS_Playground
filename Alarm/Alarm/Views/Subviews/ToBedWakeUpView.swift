//
//  ToBedWakeUpView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/25/24.
//

import SwiftUI

struct ToBedWakeUpView: View {
    
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        VStack {

            CancelSaveAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
            
            HStack(alignment: .center) {
                Text("Toggle Alarm")
            }
            
            Divider()
            
            HStack {
                Grid {
                    GridRow {
                        HStack(alignment: .center, spacing: 5) {
                            TimeOfDayIcon(date: alarmModel.start)
                                .font(.largeTitle)
                            VStack(alignment: .leading, spacing: 0) {
                                GrayedTextView(text: "start")
                                
                                Text("Time Picker")
                            }
                        }
                    }
                    
                    GridRow {
                        HStack {
                            Divider()
                                .frame(height: 30)
                                .padding(2)
                        }
                    }
                    
                    GridRow {
                        HStack {
                            Image(systemName: alarmModel.activity)
                                .foregroundStyle(alarmModel.activityColor)
                                .font(.headline)
                            
                            Text("Select Activity")
                        }
                    }
                    
                    GridRow {
                        HStack {
                            Divider()
                                .frame(height: 30)
                                .padding(2)
                        }
                    }
                    
                    GridRow {
                        HStack(alignment: .center, spacing: 5) {
                            TimeOfDayIcon(date: alarmModel.end)
                                .font(.largeTitle)
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Time Picker")
                                GrayedTextView(text: "end")
                            }
                        }
                    }
                    
                    GridRow {
                        HStack {
                            Text("Sound")
                                .fontWeight(.semibold)
                            Text(alarmModel.sounds.rawValue)
                                .font(.caption)
                                .fontWeight(.thin)
                            
                        }
                        .padding(7)
                        .overlay(
                            Capsule()
                                .stroke()
                        )
                        .contextMenu {
                            ForEach(Sounds.allCases, id: \.self) { sound in
                                Button(action: {
                                    alarmModel.sounds = sound
                                }, label: {
                                    Text(sound.rawValue)
                                })
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .padding()
        .background(
            cardBackgroundColor
                .clipShape(RoundedRectangle(cornerRadius: 20))
        )
    }
}

#Preview {
    ToBedWakeUpView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
}
