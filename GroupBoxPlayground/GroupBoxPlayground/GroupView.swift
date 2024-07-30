//
//  GroupView.swift
//  GroupBoxPlayground
//
//  Created by Thomas Cowern on 7/30/24.
//

import SwiftUI

struct GroupView: View {
    
    var isSunny: Bool
    var temperature: Int = 87
    var windSpeed: Int = 5
    var uvRating: Int = 2
    var rainTotoal: Int = 3
    
    var body: some View {
        GroupBox(label: HStack {
            Image(systemName: isSunny ? "cloud.sun.fill" : "cloud.drizzle.fill")
            Text("\(temperature)° F")
        }, content: {
            HStack {
                VStack {
                    Image(systemName: "wind")
                    Text("\(windSpeed) mph")
                }
                VStack {
                    Image(systemName: "sun.max.fill")
                    Text("\(uvRating)")
                }
                VStack {
                    Image(systemName: "drop.fill")
                    Text("\(rainTotoal) in")
                }
            }
        })
        .groupBoxStyle(WeatherCustomStyle(backgroundImage: Image(isSunny ? "sunny-sky" : "rain-in-mountains")))
    }
}

#Preview {
    GroupView(isSunny: false)
}
