//
//  Route.swift
//  Yammie
//
//  Created by Vadim Kononenko on 30.01.2023.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case temp
    
    var description: String {
        switch self {
        case .temp: return "/dish-categories"
        }
    }
}
