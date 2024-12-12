//
//  ProfilesListView.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/12/24.
//

import SwiftUI

struct ProfilesListView: View {
    
    let profiles: [VSProfile]
    
    var body: some View {
        List {
            ForEach(profiles) { profile in
                Text (profile.name)
            }
        }
    }
}

#Preview {
    ProfilesListView(profiles: ProfileManager.mock)
}
