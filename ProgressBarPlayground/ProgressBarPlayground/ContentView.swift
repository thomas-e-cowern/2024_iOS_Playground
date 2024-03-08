//
//  ContentView.swift
//  ProgressBarPlayground
//
//  Created by Thomas Cowern on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var percent: CGFloat = 0
    
    init() {
//        for familyName in UIFont.familyNames {
//            print("Family Name: \(familyName)")
//            
//            for fontName in UIFont.fontNames(forFamilyName: familyName) {
//                print("Font Name: \(fontName)")
//            }
//        }
        
//        let fontManager = NSFontManager.shared
//        let fonts = fontManager.availableFonts
//        for name in fonts {
//            print(name)
//        }
    }
    
    var body: some View {
        VStack(spacing: 50) {
            if percent < 100 {
                Text("\(Int(percent))")
            } else {
                Text("Complete")
            }
            
            ProgressBar(width: 200, heigt: 20, percent: percent)
            
            Button {
                makeMove()
            } label: {
                Text("Start")
            }
            
            Button(action: {
                percent = 0
            }, label: {
                Text("Reset")
            })

        }
        .padding()
    }
    
    func makeMove() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if percent <= 99 {
                percent = percent + 1
            } else {
                return
            }
        }
    }
}

#Preview {
    ContentView()
}
