//
//  Dish.swift
//  Yammie
//
//  Created by Vadim Kononenko on 26.01.2023.
//

import Foundation

struct Dish {
    let id, name, description, image: String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%0.2f calories", calories ?? 0)
    }
    
    static func fetchPopulars() -> [Dish] {
        [
            .init(id: "id1", name: "Garri", description: "This is the best I have ever eatten", image: "https://picsum.photos/100/200", calories: 42.54),
            .init(id: "id2", name: "Indomie", description: "This is the best I have ever eatten", image: "https://picsum.photos/100/200", calories: 324.23),
            .init(id: "id3", name: "Pizza", description: "This is the best I have ever eatten", image: "https://picsum.photos/100/200", calories: 534.98)
        ]
    }
    
    static func fetchSpecials() -> [Dish] {
        [
            .init(id: "id1", name: "Fried Plantain", description: "This is my favourite dish", image: "https://picsum.photos/100/200", calories: 314),
            .init(id: "id2", name: "Beans and Garri", description: "This is my favourite dish", image: "https://picsum.photos/100/200", calories: 1004)
        ]
    }
}
