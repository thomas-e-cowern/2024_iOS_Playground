//
//  ContentView.swift
//  BirdFinder
//
//  Created by Thomas Cowern on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var observations = [BirdObservation]()
    
    var body: some View {
        VStack {
            NavigationStack {
                List(observations, id: \.self) { observation in
                    NavigationLink {
                        ObservationDetailView(observation: observation)
                    } label: {
                        Text(observation.comName)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            print("👍👍👍👍 Observation Response below 👍👍👍👍")
            observations = try! StaticJSONMapper.decode(file: "StaticBirdData", type: [BirdObservation].self)
            dump(observations)
        }
    }
}

#Preview {
    ContentView()
}
