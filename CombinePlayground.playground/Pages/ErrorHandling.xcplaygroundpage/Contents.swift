import Foundation
import UIKit
import Combine

enum NumberError: Error {
    case operationFailed
}

let numbersPublisher = [1, 2, 3, 4, 5, 6, 7, 8, 9].publisher

let doubledPublisher = numbersPublisher.tryMap { number in
    if number == 4 {
        throw NumberError.operationFailed
    }
    
    return number * 2
}.mapError { error in
    return NumberError.operationFailed
}

let cancellable = doubledPublisher.sink { completion in
    switch completion {
    case .finished:
        print("Finished")
    case .failure(let error):
        print("Error in cancellable: \(error)")

    }
} receiveValue: { value in
    print("Value: \(value)")
}


//let doubledPublisher = numbersPublisher.tryMap { number in
//    if number == 4 {
//        throw NumberError.operationFailed
//    }
//    
//    return number * 2
//}
//    .catch { error in
//        if let numberError = error as? NumberError {
//            print("Error occurred: \(numberError)")
//        }
//        
//        return Just(0)
//    }
//
//let cancellable = doubledPublisher.sink { completion in
//    switch completion {
//    case .finished:
//        print("Finished")
//    case .failure(let error):
//        print("Error in cancellable: \(error)")
//    
//    }
//} receiveValue: { value in
//    print("Value: \(value)")
//}



