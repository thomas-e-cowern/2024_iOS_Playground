//
//  ContentView.swift
//  NavigationStackTutorial
//
//  Created by Thomas Cowern on 2/28/24.
//

import SwiftUI

struct CarBrand: Identifiable, Hashable {
    let id = NSUUID().uuidString
    let name: String
}

struct Car: Identifiable, Hashable {
    let id = NSUUID().uuidString
    let make: String
    let model: String
    let year: Int
    
    var descrtiption: String {
        return "\(year) \(make) \(model)"
    }
}

struct ContentView: View {
    
    let brands: [CarBrand] = [
        .init(name: "Chevy"),
        .init(name: "Ford"),
        .init(name: "Chrysler"),
        .init(name: "Pontiac")
    ]
    
    let cars: [Car] = [
        .init(make: "Chevy", model: "Camaro", year: 2010),
        .init(make: "Ford", model: "Mustang", year: 2017),
        .init(make: "Chrysler", model: "Daddy Van", year: 2019),
        .init(make: "Pontiac", model: "Fiero", year: 1985)
    ]
    
    @State private var navigationPath = [CarBrand]()
    @State private var showFullStack: Bool = false
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                List {
                    Section("Manufacturers") {
                        ForEach(brands) { brand in
                            NavigationLink(value: brand) {
                                Text(brand.name)
                            }
                        }
                    }
                    
                    Section("Cars") {
                        ForEach(cars) { car in
                            NavigationLink(value: car) {
                                Text(car.descrtiption)
                            }
                        }
                    }
                }
                .navigationDestination(for: CarBrand.self) { brand in
                    VStack {
                        viewForBrand(brand)
                        
                        Button(action: {
                            navigationPath = []
                        }, label: {
                            Text("Go to root")
                        })
                    }
                }
                .navigationDestination(for: Car.self) { car in
                    Color.red
                }
                
                Button(action: {
                    showFullStack.toggle()
                    if showFullStack {
                        navigationPath = brands
                    } else {
                        navigationPath = [brands[0], brands[2], brands[1]]
                    }
                }, label: {
                    Text("View All")
                })
            }
        }
    }
    
    func viewForBrand(_ brand: CarBrand) -> AnyView {
        switch brand.name {
        case "Chevy":
            return AnyView(Color.red)
        case "Ford":
            return AnyView(Color.blue)
        case "Chrysler":
            return AnyView(Color.green)
        case "Pontiac":
            return AnyView(Color.gray)
        default:
            return AnyView(Color.white)
        }
    }
}

#Preview {
    ContentView()
}
