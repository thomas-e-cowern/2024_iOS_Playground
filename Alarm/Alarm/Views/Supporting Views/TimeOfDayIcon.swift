//
//  TimeOfDayIcon.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/23/24.
//

import SwiftUI

struct TimeOfDayIcon: View {
    
    // MARK: - Properties
    let date: Date
    
    var percent: CGFloat {
        return dateToPercent(date: date)
    }
    
    var hour: Int {
        return Int(24 * percent)
    }
    
    var image: (name: String, color: Color) {
        switch hour {
        case 6..<8:
            return ("sun.horizon.fill", .orange)
        case 8..<17:
            return ("sun.max.fill", .yellow)
        case 17..<20:
            return ("sun.horizon.fill", .pink)
        case 20..<6:
            return ("moon.fill", .black)
        default:
            return ("moon.stars.fill", .black)
        }
    }
    
    // MARK: - Body
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - Preview
#Preview {
    TimeOfDayIcon(date: Date())
}
