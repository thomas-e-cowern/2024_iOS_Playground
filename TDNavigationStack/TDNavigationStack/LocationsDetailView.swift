//
//  LocationsDetailView.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/12/24.
//

import SwiftUI

struct LocationsDetailView: View {
    
    let locations: [Location]
    
    var body: some View {
        List {
            ForEach(locations, id: \.name) { location in
                /*@START_MENU_TOKEN@*/Text(location.name)/*@END_MENU_TOKEN*/
            }
        }
        .navigationTitle("Locations")
    }
}

#Preview {
    LocationsDetailView(locations: foods[0].locations!)
}
