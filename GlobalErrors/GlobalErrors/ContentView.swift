//
//  ContentView.swift
//  GlobalErrors
//
//  Created by Thomas Cowern on 1/29/24.
//

import SwiftUI

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidancee: String
}

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        VStack {
            Text("An error has occurred")
                .font(.title)
                .padding()
            Text(errorWrapper.error.localizedDescription)
                .padding(.horizontal, 10)
            Text(errorWrapper.guidancee)
                .font(.caption)
        }
    }
}

struct ErrorView_Preview: PreviewProvider {
    
    enum simpleError: Error {
        case opertionFailed
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: ErrorWrapper(error: simpleError.opertionFailed, guidancee: "Please try again..."))
    }
}

struct ContentView: View {
    
    @State private var errorWrapper: ErrorWrapper?
    
    enum AuthenticationError: Error {
        case invalidCredentials
    }
    
    var body: some View {
        VStack {
            Button(action: {
                do {
                    try authenticate()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidancee: "Please check your user and password and try again")
                }
            }, label: {
                Text("Throw Error")
            })
            .buttonStyle(.bordered)
        }
        .padding()
        .sheet(item: $errorWrapper) { errorWrapper in
            ErrorView(errorWrapper: errorWrapper)
        }
    }
    
    private func authenticate() throws {
        throw AuthenticationError.invalidCredentials
    }
}

#Preview {
    ContentView()
}
