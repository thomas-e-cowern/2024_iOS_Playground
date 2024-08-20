//
//  UnitTestingBootcampViewModel.swift
//  UnitTestingBootcamp
//
//  Created by Thomas Cowern on 8/7/24.
//

import Foundation
import SwiftUI
import Combine

class UnitTestingBootcampViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    @Published var selectedItem: String? = nil
    
    let dataService: NewDataServiceProtocol
    
    var cancellables = Set<AnyCancellable>()
    
    init(isPremium: Bool, dataService: NewDataServiceProtocol = NewMockDataService(items: nil)) {
        self.isPremium = isPremium
        self.dataService = dataService
    }
    
    func addItem(item: String) {
        guard !item.isEmpty else { return }
        self.dataArray.append(item)
    }
    
    func selectItem(item: String) {
        if let x = dataArray.first(where: { $0 == item }) {
            selectedItem = x
        } else {
            selectedItem = nil
        }
    }
    
    func saveItem(item: String) throws {
        
        guard !item.isEmpty else {
            throw DataError.noData
        }
        
        if let x = dataArray.first(where: { $0 == item }) {
            print("Save item here... \(x)")
        } else {
            throw DataError.itemNotFound
        }
    }
    
    func downloadWithEscaping() {
        dataService.downloadItemWithEscaping { [weak self] returnedItems in
            self?.dataArray = returnedItems
        }
    }
    
    func downloadWithCombine() {
        dataService.downloadItemsWithCombine()
            .sink { _ in
                // more to come
            } receiveValue: { [weak self] returnedItems in
                self?.dataArray = returnedItems
            }
            .store(in: &cancellables)

    }
    
    enum DataError: LocalizedError {
        case noData
        case itemNotFound
    }
}
