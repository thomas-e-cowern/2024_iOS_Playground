//
//  DataItemModel.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/11/24.
//

import Foundation
import SwiftUI

/// The Data Item Model includes a generated id, a text variable of type string, and a color varaible of type color.  It confomrs to the idendifiable protocol.
struct DataItemModel: Identifiable {
    let id = UUID()
    let text: String
    let color: Color
}
