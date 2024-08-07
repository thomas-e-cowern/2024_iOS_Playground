//
//  UnitTestingBootcampViewModel.swift
//  UnitTestingBootcamp
//
//  Created by Thomas Cowern on 8/7/24.
//

import Foundation
import SwiftUI

class UnitTestingBootcampViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
}
