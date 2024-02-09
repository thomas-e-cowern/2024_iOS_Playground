//
//  Food.swift
//  TDNavigationStack
//
//  Created by Thomas Cowern on 2/8/24.
//

import Foundation

struct Food: Identifiable, Hashable {
    var id: String { "\(name)_\(title)" }
    let name: String
    let title: String
    let description: String
    let price: Decimal
}

let foods: [Food] = [
    Food(name: "🌯",
         title: "Burrito",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 7.99),
    Food(name: "🍜",
         title: "Ramen",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 10.99),
    Food(name: "🍔",
         title: "Burger",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 4.99),
    Food(name: "🍕",
         title: "Pizza",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 1.99),
    Food(name: "🌭",
         title: "Hotdog",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 0.99),
    Food(name: "🧆",
         title: "Falafel",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 2.99),
    Food(name: "🍝",
         title: "Spag Bol",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 12.99)
]

struct Drink: Identifiable, Hashable {
    var id: String { "\(name)_\(title)" }
    let name: String
    let title: String
    let description: String
    let isFizzy: Bool
    let price: Decimal
}

let drinks: [Drink] = [
    Drink(name: "🥤",
          title: "Soda",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: true,
          price: 2.99),
    Drink(name: "🧋",
          title: "Boba Tea",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: false,
          price: 3.99),
    Drink(name: "🧃",
          title: "Juice",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: false,
          price: 0.99)
]
