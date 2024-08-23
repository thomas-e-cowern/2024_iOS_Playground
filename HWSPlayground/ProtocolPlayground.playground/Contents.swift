import UIKit

protocol Vehicle {
    func estimatedTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    func estimatedTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance) miles")
    }
    
    func openSunroof() {
        print("It's Florida and sunny")
    }
}

struct Bicycle: Vehicle {
    func estimatedTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance) miles")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimatedTime(for: distance) > 100 {
        print("That's too slow, I'll try a different vehicle")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 50, using: car)

let bicycle = Bicycle()
commute(distance: 100, using: bicycle)
