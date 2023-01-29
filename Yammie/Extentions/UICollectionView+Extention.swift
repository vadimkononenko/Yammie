//
//  UICollectionView+Extention.swift
//  Yammie
//
//  Created by Vadim Kononenko on 29.01.2023.
//

import UIKit

extension UICollectionView {
    static func createHorizontalCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }
}
