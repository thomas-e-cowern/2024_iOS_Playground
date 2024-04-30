import UIKit

func challenge1(input: String) -> Bool {
    
    var usedLetters = [Character]()
    
    let inputArray = Array(input)
    
    for letter in inputArray {
        if usedLetters.contains(letter) {
            // Note: contains is an O(n) operation and is slow for large strings
            return false
        } else {
            usedLetters.append(letter)
        }
    }
    
    return true
}

func challenge1a(input: String) -> Bool {
    return Set(input).count == input.count
}

func challenge1b(input: String) -> Bool {
    for i in 0..<input.count {
            for j in (i+1)..<input.count {
                let firstIndex = input.index(input.startIndex, offsetBy: i)
                let secondIndex = input.index(input.startIndex, offsetBy: j)
                if (input[firstIndex] == input[secondIndex]) {
                    return false
                }
            }
        }
        return true
}

//challenge1a(input: "AaBbCc")
//challenge1(input: "AaBbCcC")
challenge1b(input: "AaBbCc")
