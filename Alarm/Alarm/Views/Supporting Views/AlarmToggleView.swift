//
//  AlarmToggleView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/26/24.
//

import SwiftUI

struct AlarmToggleView: View {
    
    @Binding var alarmEnabled: Bool
    
    var body: some View {
        HStack {
            GrayedTextView(text: "alarm")
            
            Spacer()
            
            TheToggleView(isOn: $alarmEnabled)
        }
    }
}

#Preview {
    AlarmToggleView(alarmEnabled: .constant(true))
}
