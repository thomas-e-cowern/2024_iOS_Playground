//
//  CurrentDateListViewModel.swift
//  ASAsynchAwaitTimeApp
//
//  Created by Thomas Cowern on 2/2/24.
//

import Foundation

class CurrentDateListViewModel: ObservableObject {
    @Published var currentDates: [CurrentDateViewModel] = []
    
    func getAllDates() async {
        do {
            let currentDate = try await WebService().getDates()
            
            if let currentDate = currentDate {
                let currentDateVM = CurrentDateViewModel(currentDate: currentDate)
                currentDates.append(currentDateVM)
            }
        } catch {
            print("Error in CurrentDateListViewModel: \(error.localizedDescription)")
        }
        
    }
}

struct CurrentDateViewModel {
    let currentDate: CurrentDate
    
    var id: UUID {
        currentDate.id
    }
    
    var date: String {
        currentDate.date
    }
}
