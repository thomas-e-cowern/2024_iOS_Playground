import UIKit

var greeting = "Never odd or even"

func isPalindrome(str: String) -> Bool {
    
//    // One way
//    let reversedStr = str.reversed()
//    
//    if String(reversedStr).lowercased() == str.lowercased() {
//        return true
//    }
//    
//    return false
    
    // another way
    let lowercased = str.lowercased()
    
    return lowercased.reversed() == Array(lowercased) 
}

isPalindrome(str: greeting)
