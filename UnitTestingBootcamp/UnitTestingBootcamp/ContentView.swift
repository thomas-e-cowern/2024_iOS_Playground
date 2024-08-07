//
//  ContentView.swift
//  UnitTestingBootcamp
//
//  Created by Thomas Cowern on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm: UnitTestingBootcampViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingBootcampViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        VStack {
            Text(vm.isPremium.description)
        }
        .padding()
    }
}

#Preview {
    ContentView(isPremium: true)
}
