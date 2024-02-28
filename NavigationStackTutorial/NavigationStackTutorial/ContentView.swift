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
    
    var body: some View {
        NavigationStack {
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
                Text("Welcome to \(brand.name)")
            }
            .navigationDestination(for: Car.self) { car in
                Color.red
            }
        }
    }
}

#Preview {
    ContentView()
}
