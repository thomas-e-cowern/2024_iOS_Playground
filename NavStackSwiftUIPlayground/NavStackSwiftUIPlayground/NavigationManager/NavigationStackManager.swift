//
//  NavigationStackManager.swift
//  NavStackSwiftUIPlayground
//
//  Created by Thomas Cowern on 9/10/24.
//

import SwiftUI

enum Routes {
    case list
    case character
    case credits
    case quotes
}

struct NavigationStackManager: View {
    @State private var navPaths = [Routes]()
    
    var body: some View {
        NavigationStack(path: $navPaths) {
            ListView(navPaths: $navPaths).navigationDestination(for: Routes.self) { r in
                switch(r) {
                case .list:
                    ListView(navPaths: $navPaths)
                case .character:
                    CharacterView(navPaths: $navPaths).navigationBarBackButtonHidden(true)
                case .credits:
                    CreditView(navPaths: $navPaths).navigationBarBackButtonHidden(true)
                case .quotes:
                    QuoteView(navPaths: $navPaths).navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}


#Preview {
    NavigationStackManager()
}
