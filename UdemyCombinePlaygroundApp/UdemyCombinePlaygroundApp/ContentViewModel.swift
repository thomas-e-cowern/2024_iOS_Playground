//
//  ContentViewModel.swift
//  UdemyCombinePlaygroundApp
//
//  Created by Thomas Cowern on 3/4/24.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var value: Int = 0
    private var cancellable: AnyCancellable?
    
    init() {
        let publisher = Timer.publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
            .map { _ in
                self.value + 1
            }
        
        cancellable = publisher.assign(to: \.value, on: self)
    }
}
