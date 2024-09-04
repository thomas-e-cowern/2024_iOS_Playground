//
//  NavigationAction.swift
//  NavigationPlayground
//
//  Created by Thomas Cowern on 9/4/24.
//

import SwiftUI

struct NavigationAction {
    
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
