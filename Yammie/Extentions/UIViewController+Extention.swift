//
//  UIViewController+Extention.swift
//  Yammie
//
//  Created by Vadim Kononenko on 27.01.2023.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}
