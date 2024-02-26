//
//  PostListView.swift
//  StaticPreviewsPlayground
//
//  Created by Thomas Cowern on 2/24/24.
//

import SwiftUI

struct PostListView: View {
    
    @State var posts: [Post]
    
    var body: some View {
        List(posts, id: \.id) { post in
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                
            }
        }
        .onAppear {
            posts = PreviewData.load(name: "posts")
        }
    }
}

#Preview {
    
    let previewPosts: [Post] = PreviewData.load(name: "posts")
    
    return PostListView(posts: previewPosts)
}
