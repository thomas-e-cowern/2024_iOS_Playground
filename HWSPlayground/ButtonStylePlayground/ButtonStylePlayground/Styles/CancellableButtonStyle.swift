//
//  CancellableButtonStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/29/24.
//

import Foundation
import SwiftUI
import Combine

struct CancellableButtonStyle: PrimitiveButtonStyle {
    private struct CancellableButton: View {
        
        @State private var timerSubscription: Cancellable?
        @State private var timer = Timer.publish(every: 1, on: .main, in: .common)
        @State private var countDown = 0
        
        let configuration: Configuration
        let timeOut: Int
        
        var body: some View {
            Button {
                if timerSubscription == nil {
                    timer = Timer.publish(every: 1, on: .main, in: .common)
                    timerSubscription = timer.connect()
                    countDown = timeOut
                } else {
                    cancelTimer()
                }
            } label: {
                if timerSubscription == nil {
                    configuration.label
                } else {
                    Text("Cancel? \(countDown)")
                }
            }
            
            .onReceive(timer, perform: { _ in
                if countDown  > 1 {
                    countDown -= 1
                } else {
                    configuration.trigger()
                    cancelTimer()
                }
            })
        }
        
        func cancelTimer() {
            timerSubscription?.cancel()
            timerSubscription = nil
        }
    }
    var timeOut = 3
    
    func makeBody(configuration: Configuration) -> some View {
        CancellableButton(configuration: configuration, timeOut: timeOut)
    }
}
