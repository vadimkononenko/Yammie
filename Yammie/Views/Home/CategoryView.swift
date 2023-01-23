//
//  CategoryView.swift
//  Yammie
//
//  Created by Vadim Kononenko on 23.01.2023.
//

import UIKit
import SnapKit

class CategoryView: UIView {
    
    private let customLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let customCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(categoryName: String) {
        self.init()
        self.customLabel.text = categoryName
        setup()
    }
    
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(customLabel)
        addSubview(customCollectionView)
    }
    
    private func setupConstraints() {
        customLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(self.snp.leading).offset(15)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(30)
        }
        customCollectionView.snp.makeConstraints { make in
            make.top.equalTo(customLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
