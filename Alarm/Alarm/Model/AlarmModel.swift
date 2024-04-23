//
//  AlarmModel.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/23/24.
//

import Foundation
import SwiftUI

struct AlarmModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let body: String
    let repeats: Bool
    var sounds: String   // MARK: TODO - Define sounds
    var alarmEnabled: Bool
    
    var start: Date
    var end: Date
    
    var activity: String
    var colorIndex: Int
    
    var activityColor: Color {
        mainColors[colorIndex]
    }
    
    var timeInterval: TimeInterval {
        end - start
    }
    
    var startTime: TimeModel {
        dateToTimeMode(date: start)
    }
    
    var endTime: TimeModel {
        dateToTimeMode(date: end)
    }
    
    static func DefaultAlarm() -> AlarmModel {
        AlarmModel(
            title: "Activity completed.",
            body: "Have a great day!",
            repeats: false,
            sounds: .lagrima,
            alarmEnabled: false,
            start: Date(),
            end: Date(),
            activity: activities[0],
            colorIndex: 0)
    }
}
