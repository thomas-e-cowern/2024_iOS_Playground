//
//  TypedThrowsTest.swift
//  HWSCareerAccelerator
//
//  Created by Thomas Cowern on 10/1/24.
//

import SwiftUI

enum GearError: Error {
    case tooHigh
    case tooLow
}

struct Car {
    var model: String
    private(set) var gear: Int = 1

    mutating func changeGear(by: Int) throws(GearError) {
        let newGear = gear + by

        if newGear > 5 {
            throw GearError.tooHigh
        } else if newGear < 1 {
            throw GearError.tooLow
        }

        gear = newGear
    }
}

struct TypedThrowsTest: View {
    
    @State var car = Car(model: "Jaguar")
    @State var gearUp: Int = +1
    @State var gearDown: Int = -1
    
    var body: some View {
        Text("\(car.gear)")
        
        Button("Gear Up!") {
            chageGear(changeType: gearUp)
        }
        
        Button("Gear Down") {
            chageGear(changeType: gearDown)
        }
    }
    
    func chageGear(changeType: Int) {
        do {
            try car.changeGear(by: changeType)
        } catch {
            switch error {
            case .tooHigh:
                print("You can't go that high")
            case .tooLow:
                print("You can't go that low")
            }
        }
        
        print("Car is now in gear \(car.gear).")
    }
}

#Preview {
    TypedThrowsTest()
}
