//
//  String+Extention.swift
//  Yammie
//
//  Created by Vadim Kononenko on 23.01.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
