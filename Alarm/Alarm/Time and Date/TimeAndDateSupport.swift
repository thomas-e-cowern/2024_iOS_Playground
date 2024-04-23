//
//  TimeAndDateSupport.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/23/24.
//

import Foundation

// MARK: Functions
func dateToPercent(date: Date) -> CGFloat {
    let result = getTimeComponents(date: date)
    
    return CGFloat(result.hour) / 24 + CGFloat(result.minute) / (60 * 24)
}

// Returns time componenets
func getTimeComponents(date: Date) -> (hour: Int, minute: Int, day: Int, month: Int, year: Int) {
    let components = Calendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: date)
    
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
    let day = components.day ?? 0
    let month = components.month ?? 0
    let year = components.year ?? 0
    
    return (hour: hour, minute: minute, day: day, month: month, year: year)
}

// Returns time in string format
func getTimeFromDate(date: Date) -> String {
    let result = getTimeComponents(date: date)
    let hour = result.hour
    let minute = result.minute
    
    let timeString = String(format: "%02d:%02d", hour, minute)
    
    return timeString
}

// Adds hours and minutes to current date
func addHourToDate(date: Date, numberOfHours: Int, numberOfMinutes: Int) -> Date {
    return date.addingTimeInterval(TimeInterval(numberOfMinutes * 60 + numberOfHours * 3600))
}

func formatDate(date: Date) -> String {
    let result = getTimeComponents(date: date)
    
    return "\(result.day)-\(result.month)-\(result.year)(\(result.hour):\(result.minute))"
}

// Get hours and seconds
func dateToTimeMode(date: Date) -> TimeModel {
    let result = getTimeComponents(date: date)
    
    return TimeModel(hour: result.hour, minute: result.minute)
}

// MARK: Extensions
// Subtract dates
extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}


