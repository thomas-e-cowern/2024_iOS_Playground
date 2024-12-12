//
//  LoadingViewState.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/12/24.
//
import Foundation

enum LoadingViewState<Result: Equatable>: Equatable {
    case loading
    case loaded(Result)
    case empty(String)
    case error(String)
}
