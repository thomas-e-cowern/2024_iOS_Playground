//
//  VSContentView.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/12/24.
//

import SwiftUI

struct VSContentView: View {
    
    @State private var viewModel: ViewModel = .init()
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.viewState {
                case .loading:
                    ProgressView()
                        .redacted(reason: .placeholder)
                        .task {
                            await viewModel.load()
                        }
                case let .loaded(profiles):
                    ProfilesListView(profiles: profiles)
                case let .empty(message):
                    ViewStateEmptyView(message: message)
                case let .error(message):
                    ViewStateErrorView(message: message) {
                        viewModel.viewState = .loading
                    }
                }
            }
            .navigationTitle("\(viewModel.viewState == .loading ? "Loading..." : "Profiles")")
        }
    }
}

#Preview {
    VSContentView()
}

fileprivate extension VSContentView {
    @Observable
    class ViewModel {
        var viewState: LoadingViewState<[VSProfile]> = .loading
        let manager = ProfileManager()
        
        func load() async {
            do {
                let profiles = try await manager.load()
                if profiles.isEmpty {
                    viewState = .empty("No profiles found")
                } else {
                    viewState = .loaded(profiles)
                }
            } catch {
                viewState = .error(error.localizedDescription)
            }
        }
    }
}
