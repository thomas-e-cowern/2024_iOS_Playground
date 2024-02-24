//
//  PostListView.swift
//  StaticPreviewsPlayground
//
//  Created by Thomas Cowern on 2/24/24.
//

import SwiftUI

struct PostListView: View {
    
    let posts: [Post]
    
    var body: some View {
        List(posts, id: \.id) { post in
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                    
            }
        }
    }
}

#Preview {
    PostListView(posts: PreviewData.load(name: "posts"))
}
