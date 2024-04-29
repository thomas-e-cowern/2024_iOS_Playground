//
//  CentralDatePickerView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/29/24.
//

import SwiftUI

struct CentralDatePickerView: View {
    
    let size: CGFloat
    var linewidth: CGFloat = 10
    @Binding var alarmModel: AlarmModel
    
    var endTime: Date {
        alarmModel.end
    }
    
    var startTime: Date {
        alarmModel.start
    }
    
    var startDateToPercent: CGFloat {
        dateToPercent(date: startTime)
    }
    
    var endDateToPercent: CGFloat {
        startDateToPercent + percentDifference
    }
    
    var percentDifference: CGFloat {
        let value = dateToPercent(date: endTime) - dateToPercent(date: startTime)
        
        return value >= 0 ? value : 1 + value
    }
    
    var rotateCircleOffset: CGFloat {
        360 * startDateToPercent
    }
    
    var body: some View {
        VStack {
            Circle()
                .stroke(lightGray, lineWidth: linewidth)
                .frame(width: size, height: size)
                .overlay {
                    VStack {
                        VStack {
                            GrayedTextView(text: "start")
                                .font(.caption)
                            
                            TimePicker(time: $alarmModel.start.animation(), scale: 1)
                        }
                        Spacer()
                        GrayedTextView(text: "Set the alarm")
                        Spacer()
                        VStack {
                            TimePicker(time: $alarmModel.end.animation(), scale: 1)
                            
                            GrayedTextView(text: "end")
                                .font(.caption)
                        }
                    }
                    .padding()
                    .padding(.vertical)
                }
        }
    }
}

#Preview {
    CentralDatePickerView(size: 200, alarmModel: .constant(AlarmModel.DefaultAlarm()))
}
