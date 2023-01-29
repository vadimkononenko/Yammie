//
//  DishCategory.swift
//  Yammie
//
//  Created by Vadim Kononenko on 23.01.2023.
//

import Foundation

struct DishCategory {
    let id, name, image: String?
    
    static func fetchCategories() -> [DishCategory] {
        [
            .init(id: "id1", name: "Africa Dish 1", image: "https://picsum.photos/100/200"),
            .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
            .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
            .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
            .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
        ]
    }
}
