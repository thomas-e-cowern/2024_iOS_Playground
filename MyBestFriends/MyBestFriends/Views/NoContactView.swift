//
//  NoContactView.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/6/24.
//

import SwiftUI

struct NoContactView: View {
    var body: some View {
        VStack {
            Text("No Contacts")
                .font(.largeTitle.bold())
            Text("You need to add some contacts")
                .font(.callout)
        }
    }
}

#Preview {
    NoContactView()
}
