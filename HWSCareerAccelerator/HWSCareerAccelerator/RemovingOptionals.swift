//
//  RemovingOptionals.swift
//  HWSCareerAccelerator
//
//  Created by Thomas Cowern on 10/3/24.
//

import SwiftUI

struct RemovingOptionals: View {
    
    let numberStrings = ["1", "2", "Three"]
    let urlStrings = ["https://apple.com", "https://swift.org", ""]
    let maybeNumbers = [1, nil, 2, nil, 3]
    @State var numberInts: [Int] = []
    @State var urls: [URL] = []
    @State var definitelyNumbers: [Int] = []
    
    var body: some View {
        VStack {
            Button("Map Me!") {
                mapMe()
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
        }
    }
    
    func mapMe() {
        numberInts = numberStrings.compactMap { Int($0) }
        urls = urlStrings.compactMap { URL(string: $0) }
        definitelyNumbers = maybeNumbers.compactMap { $0 }
    }
}

#Preview {
    RemovingOptionals()
}
