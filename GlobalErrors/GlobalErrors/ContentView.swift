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
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
