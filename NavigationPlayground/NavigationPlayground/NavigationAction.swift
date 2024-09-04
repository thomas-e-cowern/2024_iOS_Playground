//
//  NavigationAction.swift
//  NavigationPlayground
//
//  Created by Thomas Cowern on 9/4/24.
//

import SwiftUI

struct NavigateAction {
    typealias Action = (Route) -> Void
    let action: Action
    
    func callAsFunction(_ route: Route) {
        action(route)
    }
}

struct NavigateEnvironmentKey: EnvironmentKey {
    static var defaultValue: NavigateAction = NavigateAction { _ in
        
    }
}

extension EnvironmentValues {
    var navigate: (NavigateAction) {
        get { self[NavigateEnvironmentKey.self] }
        set { self[NavigateEnvironmentKey.self] = newValue }
    }
}

enum PatientRoute: Hashable {
    case list
    case create
    case detail(Patient)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            Text("PatientRoute list")
        case .create:
            Text("PatientRoute create")
        case .detail(let patient):
            Text("Patient detail for \(patient.name)")
        }
    }
}

enum DoctorRoute: Hashable {
    case list
    case create
    case detail(Doctor)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            Text("DoctorRoute list")
        case .create:
            Text("DoctorRoute create")
        case .detail(let doctor):
            Text("Doctor detail for \(doctor.name)")
        }
    }
}


enum Route: Hashable {
    case patient(PatientRoute)
    case doctor(DoctorRoute)
}
