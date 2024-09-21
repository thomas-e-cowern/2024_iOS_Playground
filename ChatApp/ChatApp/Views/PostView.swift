//
//  PostView.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/21/24.
//

import SwiftUI

struct PostView: View {
    
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.largeTitle)
            Text(post.body)
                .font(.headline)
        }
    }
}

#Preview {
    PostView(post: Post(userId: 1, id: 1, title: "Sample Post", body: "Sample Post Body"))
}
