//
//  GreetingsTip.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/15/24.
//

import Foundation
import TipKit

struct GreetingsTip: Tip {
    
    var title: Text {
        Text("Click on text and disc")
    }
    
    var message: Text? {
        Text("Text will be randomly generated and will have some nice animations")
    }
    
    var asset: Image? {
        Image(systemName: "figure.walk.motion")
    }
}
