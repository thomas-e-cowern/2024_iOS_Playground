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
    
    var state = state
    
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    default:
        break
    }
    
    return state
}

class Store: ObservableObject {
    
    var reducer: Reducer
    var state: State
    
    init(reducer: @escaping Reducer, state: State = State()) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}

protocol Action {  }

struct IncrementAction: Action {  }
