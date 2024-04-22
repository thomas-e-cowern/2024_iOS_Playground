//
//  MainAlarmView.swift
//  Alarm
//
//  Created by Thomas Cowern on 4/22/24.
//

import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, alarm!")
        }
        .padding()
    }
}

#Preview {
    MainAlarmView()
}
