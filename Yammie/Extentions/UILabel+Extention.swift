//
//  UILabel+Extention.swift
//  Yammie
//
//  Created by Vadim Kononenko on 29.01.2023.
//

import UIKit

extension UILabel {
    static func createSectionLabel(name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }
}
