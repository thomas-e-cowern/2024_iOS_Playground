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
                .padding()
            
            HStack(alignment: .center) {
                Text("alarm")
                Spacer()
                TheToggleView(isOn: $alarmModel.alarmEnabled)
            }
            .padding(20)
            
            Divider()
            
            VStack {
                Grid {
                    GridRow {
                        HStack(alignment: .center, spacing: 20) {
                            TimeOfDayIcon(date: alarmModel.start)
                                .font(.largeTitle)
                            VStack(alignment: .leading, spacing: 10) {
                                GrayedTextView(text: "start")
                                
                                TimePicker(time: $alarmModel.start, scale: 1.3)
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
                            
                            Spacer()
                                .frame(width: 20)
                            
                            SelectActivityView(currentColorIndex: $alarmModel.colorIndex, currentActivity: $alarmModel.activity)
                        }
                        .padding()
                    }
                    
                    GridRow {
                        HStack {
                            Divider()
                                .frame(height: 30)
                                .padding(2)
                        }
                    }
                    
                    GridRow {
                        HStack(alignment: .center, spacing: 20) {
                            TimeOfDayIcon(date: alarmModel.end)
                                .font(.largeTitle)
                            VStack(alignment: .leading, spacing: 10) {
                                TimePicker(time: $alarmModel.end, scale: 1.3)
                                GrayedTextView(text: "end")
                            }
                        }
                    }
                    
                    GridRow {
                        Menu(content: {
                            ForEach(Sounds.allCases, id: \.self) { sound in
                                Button(action: {
                                    alarmModel.sounds = sound
                                }, label: {
                                    Text(sound.rawValue.formatSoundName)
                                })
                            }
                        }, label: {
                            HStack {
                                Text("Sound")
                                    .fontWeight(.semibold)
                                Text(alarmModel.sounds.rawValue.formatSoundName)
                                    .font(.caption)
                                    .fontWeight(.thin)
                                
                            }
                            .padding(7)
                            .overlay(
                                Capsule()
                                    .stroke()
                            )
                        })
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
