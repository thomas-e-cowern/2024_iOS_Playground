//
//  ObservationDetailView.swift
//  BirdFinder
//
//  Created by Thomas Cowern on 3/5/24.
//

import SwiftUI

struct ObservationDetailView: View {
    
    let observation: BirdObservation
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: makeUrl(sciName: observation.sciName))) { image in
                    image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            Text(observation.comName)
        }
    }
    
    private func makeUrl(sciName: String) -> String {
        
        let reformattedBirdName = sciName.replacingOccurrences(of: " ", with: "-")
        print(sciName)
        print(reformattedBirdName)
        return "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/\(reformattedBirdName).jpg/300px-Alopochen-aegyptiacus.jpg"
        
    }
}

#Preview {
    
    var previewObservation: BirdObservation {
        let observations = try! StaticJSONMapper.decode(file: "StaticBirdData", type: [BirdObservation].self)
        
        return observations[0]
    }
    
    return ObservationDetailView(observation: previewObservation)
}
