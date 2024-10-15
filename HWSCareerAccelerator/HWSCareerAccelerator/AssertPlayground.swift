//
//  AssertPlayground.swift
//  HWSCareerAccelerator
//
//  Created by Thomas Cowern on 10/15/24.
//

import SwiftUI

struct AssertPlayground: View {
    
    @State private var answer: Int = 0
    let number = Int.random(in: 1...6)
    
    var body: some View {
        Button("Test numbers") {
//            answer = sum(of: [])
            print("The number is \(number)")
            checkNumber(number: number)
        }
    }
    
    func sum(of numbers: [Int]) -> Int {
        assert(numbers.count > 0, "This should always be given some numbers to sum.")
        return numbers.reduce(0, +)
    }
    
    func checkNumber(number: Int) {
        switch number {
        case 1:
            print("You rolled a one!")
        case 2:
            print("You rolled a two!")
        case 3:
            print("You rolled a three!")
        default:
            assertionFailure("Rolling a 3-sided dice shouldn't have any other results.")
        }
    }
}

#Preview {
    AssertPlayground()
}
