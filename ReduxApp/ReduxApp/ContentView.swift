//
//  ContentView.swift
//  ReduxApp
//
//  Created by Thomas Cowern on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store
    
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
    }
    
    private func map(state: State) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        })
    }
    
    var body: some View {
        
        let props = map(state: store.state)
        
        VStack {
            Text("\(store.state)")
                .padding()
            Button("Increment") {
                props.onIncrement()
            }
        }
    }
}

#Preview {
    ContentView()
}
