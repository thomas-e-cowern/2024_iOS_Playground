//
//  ShoppingCartManager.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/9/24.
//

import Foundation

struct CartItem: Identifiable, Hashable {
    let id: String
    let title: String
    let name: String
    let price: Decimal
    
    init(_ item: any MenuItem) {
        self.id = "\(item.name)_\(item.title)"
        self.title = item.title
        self.name = item.name
        self.price = item.price
    }
}

final class ShoppingCartManager: ObservableObject {
    
    @Published private(set) var items: [CartItem] = []
    
    func add(_ item: any MenuItem) {
        items.append(CartItem(item))
    }
    
    func remove(id: String) {
        items.removeAll(where: { $0.id == id })
    }
    
    func getGroupedCart() -> [CartItem: Int] {
        var itemCounts = [CartItem: Int]()
        for item in items {
            itemCounts[item, default: 0] += 1
        }
        return itemCounts
    }
    
    func getTotal() -> Decimal {
        items.reduce(0) { $0 + $1.price }
    }
}
