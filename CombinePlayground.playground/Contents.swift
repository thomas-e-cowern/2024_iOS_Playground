import UIKit
import Combine

let numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]

numbersArray.publisher.sink { number in
    print(number)
}

print("*************")

let doublePublisher = numbersArray.publisher.map { $0 * 2 }

doublePublisher.sink { number in
    print(number)
}


//let publisher = Just("Hello World")
//
//let cancellable = publisher.sink { value in
//    print(value)
//}
//
//cancellable.cancel()
