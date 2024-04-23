//
//  TimeModel.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/23/24.
//

import Foundation

struct TimeModel: Equatable, Comparable, Identifiable {
    
    let id = UUID()
    let hour: Int
    let minute: Int
    
    static func < (lhs: TimeModel, rhs: TimeModel) -> Bool {
        if (lhs.hour < lhs.hour) {
            return true
        } else if (lhs.hour == rhs.hour && lhs.minute < rhs.minute) {
            return true
        } else {
            return false
        }
        
        // More concise way to do this...
        // return (lhs.hour < lhs.hour) || (lhs.hour == rhs.hour && lhs.minute < rhs.minute)
    }
}
