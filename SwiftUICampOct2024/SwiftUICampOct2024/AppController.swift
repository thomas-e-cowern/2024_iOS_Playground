//
//  AppController.swift
//  SwiftUICampOct2024
//
//  Created by Thomas Cowern on 10/16/24.
//
import SwiftUI

@Observable
class AppController {
    var profile = Profile()
    
    func changeToBobby() {
        profile.name = "Bobby"
    }
}
