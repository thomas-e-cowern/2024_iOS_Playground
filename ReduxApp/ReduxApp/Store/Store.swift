//
//  Store.swift
//  ReduxApp
//
//  Created by Thomas Cowern on 4/10/24.
//

import Foundation

typealias Reducer = (_ state: State, _ action: Action) -> State

struct State {
    var counter: Int = 0
}

func reducer(_ state: State, _ action: Action) -> State {
    return state
}

class Store {
    
    var reducer: Reducer
    var state: State
    
    init(reducer: @escaping Reducer, state: State = State()) {
        self.reducer = reducer
        self.state = state
    }
}

protocol Action {  }
