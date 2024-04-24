//
//  EnableNotificationsView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/24/24.
//

import SwiftUI

struct EnableNotificationsView: View {
    var body: some View {
        ZStack {
            FourCoolCirclesView()
            VStack {
                CoolTextView(text: LocalizedStringKey("Enable notifications, please"), size: 48)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    print("Notifications Enabled")
                }, label: {
                    ButtonView(text: "enable")
                        .padding()
                })
            }
        }
    }
}

#Preview {
    EnableNotificationsView()
}
