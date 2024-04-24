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
    var sounds: Sounds
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
    
    static func DummyAlarmData() -> [AlarmModel] {
        [
            AlarmModel( title: "Activity completed.", body: "Have a great day!", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 3, numberOfMinutes: 15), activity: "moon.zzz.fill", colorIndex: 0),
            AlarmModel( title: "Yo yo !", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 20, numberOfMinutes: 30), activity: "sun.max.fill", colorIndex: 2),
            AlarmModel( title: "Another title", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: false, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 7, numberOfMinutes: 0), activity: "figure.skiing.downhill", colorIndex: 1),
            AlarmModel( title: "Activity completed.", body: "Have a great day!", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 20, numberOfMinutes: 7), activity: "moon.zzz.fill", colorIndex: 0),
            AlarmModel( title: "Yo yo !", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 1, numberOfMinutes: 15), activity: "sun.max.fill", colorIndex: 2),
            AlarmModel( title: "Another title", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: false, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 3, numberOfMinutes: 45), activity: "figure.skiing.downhill", colorIndex: 1),
            AlarmModel( title: "Activity completed.", body: "Have a great day!", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 20, numberOfMinutes: 15), activity: "moon.zzz.fill", colorIndex: 0),
            AlarmModel( title: "Yo yo !", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 20, numberOfMinutes: 5), activity: "sun.max.fill", colorIndex: 2),
            AlarmModel( title: "Another title", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: false, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 22, numberOfMinutes: 00), activity: "figure.skiing.downhill", colorIndex: 1),
            AlarmModel( title: "Activity completed.", body: "Have a great day!", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 7, numberOfMinutes: 50), activity: "moon.zzz.fill", colorIndex: 0),
            AlarmModel( title: "Yo yo !", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 18, numberOfMinutes: 35), activity: "sun.max.fill", colorIndex: 2),
            AlarmModel( title: "Another title", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: false, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 23, numberOfMinutes: 0), activity: "figure.skiing.downhill", colorIndex: 1),
            AlarmModel( title: "Activity completed.", body: "Have a great day!", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 0, numberOfMinutes: 10), activity: "moon.zzz.fill", colorIndex: 0),
            AlarmModel( title: "Yo yo !", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 0, numberOfMinutes: 20), activity: "sun.max.fill", colorIndex: 2),
            AlarmModel( title: "Another title", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: false, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 0, numberOfMinutes: 30), activity: "figure.skiing.downhill", colorIndex: 1),
            AlarmModel( title: "Activity completed.", body: "Have a great day!", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 0, numberOfMinutes: 10), activity: "moon.zzz.fill", colorIndex: 0),
            AlarmModel( title: "Yo yo !", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: true, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 0, numberOfMinutes: 20), activity: "sun.max.fill", colorIndex: 2),
            AlarmModel( title: "Another title", body: "Peace", repeats: false, sounds: .lagrima, alarmEnabled: false, start: Date(), end: addHourToDate(date: Date(), numberOfHours: 0, numberOfMinutes: 30), activity: "figure.skiing.downhill", colorIndex: 1)
        ]
            .sorted(by: {$0.endTime < $1.endTime})
    }
}
