//
//  RemovingOptionals.swift
//  HWSCareerAccelerator
//
//  Created by Thomas Cowern on 10/3/24.
//

import SwiftUI

enum PasswordError: Error {
    case obvious(detailedError: String)
}

struct RemovingOptionals: View {
    
    let numberStrings = ["1", "2", "Three"]
    let urlStrings = ["https://apple.com", "https://swift.org", "", nil]
    let maybeNumbers = [1, nil, 2, nil, 3]
    @State var numberInts: [Int] = []
    @State var urls: [URL] = []
    @State var definitelyNumbers: [Int] = []
    @State var encryptResult: String = ""
    
    var body: some View {
        VStack {
            Button("Map Me!") {
                mapMe()
                
                do {
                    try encryptResult = encrypt(key: "12345") ?? "Failed Encryption"
                } catch {
                    print(error)
                }
                
            }
            Spacer()
                .frame(height: 20)
            HStack {
                ForEach(numberInts, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .frame(height: 20)
            HStack {
                ForEach(urls, id: \.self) { url in
                    Text("\(url)")
                }
            }
            .frame(height: 20)
            HStack {
                ForEach(definitelyNumbers, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .frame(height: 20)
            Text(encryptResult)
        }
    }
    
    func mapMe() {
        numberInts = numberStrings.compactMap { Int($0) }
        urls = urlStrings.compactMap { URL(string: $0 ?? "") }
        definitelyNumbers = maybeNumbers.compactMap { $0 }
    }
    
    func encrypt(key: String) throws -> String? {
        if key == "12345" {
            print("I have the same key on my luggage.")
            throw PasswordError.obvious(detailedError: "I have the same key on my luggage.")
        }

        return "Encryption complete"
    }
}

#Preview {
    RemovingOptionals()
}
