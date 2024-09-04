//
//  NavigationAction.swift
//  NavigationPlayground
//
//  Created by Thomas Cowern on 9/4/24.
//

import Foundation

struct NavigationAction {
    
}

enum PatientRoute: Hashable {
    case list
    case create
    case detail(patient)
}

enum Route: Hashable {
    case patientList
    case patientAdd
    case patientDetail
    case doctor
}
