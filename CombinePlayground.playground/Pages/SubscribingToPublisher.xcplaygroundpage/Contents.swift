

import Foundation
import UIKit
import Combine

// Subscription Lifecycles
let numbersPublisher = (1...10).publisher

let cancellable = numbersPublisher.sink { value in
    print(value)
}

DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    cancellable.cancel()
}

//// Timer
//let timerPublisher = Timer.publish(every: 1, on: .main, in: .common)
//
//let cancellable = timerPublisher.autoconnect().sink { timestamp in
//    print("Timestamp: \(timestamp)")
//}


