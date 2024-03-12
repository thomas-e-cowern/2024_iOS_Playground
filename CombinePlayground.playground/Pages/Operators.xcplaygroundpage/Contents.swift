import Foundation
import Combine

// Merge
let publisher1 = [1,2,3].publisher
let publisher2 = [1,2,3].publisher

let mergedPublisher = Publishers.Merge(publisher1, publisher2)

let cancellable = mergedPublisher.sink { value in
    print(value)
}

//// Flat Map
//let namePublisher = ["John", "Mary", "Stephen", "Dan", "Beth"].publisher
//
//let flattenedNamePublisher = namePublisher.flatMap { name in
//    name.publisher
//}
//
//flattenedNamePublisher.sink { value in
//    print(value)
//}

//// Map
//let numberPublisher = (1...5).publisher
//
//let squaredPublisher = numberPublisher.map { $0 * $0 }
//
//let stringValuePublisher = numberPublisher.map { "Item number \($0)" }
//
//squaredPublisher.sink { value in
//    print(value)
//}
//
//stringValuePublisher.sink { value in
//    print(value)
//}

