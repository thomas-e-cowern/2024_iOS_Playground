//
//  MovieReviewScreen.swift
//  SwiftuiRouting
//
//  Created by Thomas Cowern on 3/4/24.
//

import SwiftUI

struct MovieReviewScreen: View {
    
    let reviews: [Review]
    
    var body: some View {
        Text(reviews[0].text)
    }
}

#Preview {
    MovieReviewScreen(reviews: [Review(text: "Worst Movie Ever....")])
}
