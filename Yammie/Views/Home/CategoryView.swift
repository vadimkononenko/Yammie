//
//  CategoryView.swift
//  Yammie
//
//  Created by Vadim Kononenko on 23.01.2023.
//

import UIKit
import SnapKit

class CategoryView: UIView {
    
    private let categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish 1", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    private let customLabel: UILabel = {
        let label = UILabel()
        label.text = "Food Category"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var customCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.showsVerticalScrollIndicator = false
        collView.showsHorizontalScrollIndicator = false
        return collView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = customCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
}

extension CategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: customCollectionView.frame.width/2.5, height: customCollectionView.frame.height/2 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
    }
}
