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

challenge1a(input: "AaBbCc")
