//
//   UITestingBootcampViewModel.swift
//  UITestingBootcamp
//
//  Created by Thomas Cowern on 8/30/24.
//

import Foundation
import SwiftUI

class UITestingBootcampViewModel: ObservableObject {
    let placeholderTest: String = "Add your name..."
    @Published var textFieldText: String = ""
}
