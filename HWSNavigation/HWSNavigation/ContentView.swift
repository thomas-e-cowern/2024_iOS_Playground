//
//  ContentView.swift
//  HWSNavigation
//
//  Created by Thomas Cowern on 2/28/24.
//

import SwiftUI

struct DetailView: View {
    
    var number: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
//    var body: some View {
//        NavigationStack(path: $path) {
//            List {
//                ForEach(0..<5) { i in
//                    NavigationLink("Select Number: \(i)", value: i)
//                }
//                
//                ForEach(0..<5) { i in
//                    NavigationLink("Select String: \(i)", value: String(i))
//                }
//            }
//            .toolbar {
//                Button("Show 32") {
//                    path.append(556)
//                }
//                
//                Button("Push Hello") {
//                    path.append("Hello")
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
//            .navigationDestination(for: String.self) { selection in
//                Text("You selected string \(selection)")
//            }
//        }
//        
//    }
    
    //    var body: some View {
    //        NavigationStack(path: $path) {
    //            VStack {
    //                Button("Show 32") {
    //                    path = [32]
    //                }
    //
    //                Button("Show 64") {
    //                    path.append(64)
    //                }
    //
    //                Button("Show 32 & 64") {
    //                    path = [32, 64]
    //                }
    //            }
    //            .navigationDestination(for: Int.self) { selection in
    //                Text("You selected \(selection)")
    //            }
    //        }
    //    }
}

#Preview {
    ContentView()
}
