//
//  CategoryView.swift
//  Yammie
//
//  Created by Vadim Kononenko on 23.01.2023.
//

import UIKit
import SnapKit

class CategoryView: UIView {
    
    private var categories: [DishCategory]?
    
    private let customLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return layout
    }()
    
    private lazy var customCollectionView: UICollectionView = {
        let collView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collView.showsVerticalScrollIndicator = false
        collView.showsHorizontalScrollIndicator = false
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
    
    convenience init(categoryName: String, categories: [DishCategory]) {
        self.init()
        self.customLabel.text = categoryName
        self.categories = categories
        setup()
    }
    
    private func setup() {
        setupViews()
        setupConstraints()
        registerCell()
    }
    
    private func registerCell() {
        customCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseId)
    }
    
    private func setupViews() {
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
        addSubview(customLabel)
        addSubview(customCollectionView)
    }
    
    private func setupConstraints() {
        customLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(self.snp.leading).offset(20)
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

extension CategoryView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = customCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categories![indexPath.row])
        return cell
    }
}
