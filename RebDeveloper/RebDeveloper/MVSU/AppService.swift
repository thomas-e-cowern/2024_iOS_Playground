//
//  AppService.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/10/24.
//
import SwiftUI

@Observable
class AppService {
    var profile: Profile = Profile()
    
    func changeName() {
        profile.name = APIUtility.fetchName()
    }
}
