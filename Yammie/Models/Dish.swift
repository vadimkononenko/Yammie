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
        return String(format: "%2f calories", calories ?? 0)
    }
}
