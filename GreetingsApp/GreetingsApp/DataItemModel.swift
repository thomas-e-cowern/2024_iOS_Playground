//
//  DataItemModel.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/11/24.
//

import Foundation
import SwiftUI

struct DataItemModel: Identifiable {
    let id = UUID()
    let text: String
    let color: Color
}
