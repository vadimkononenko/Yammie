//
//  PopularDishesView.swift
//  Yammie
//
//  Created by Vadim Kononenko on 26.01.2023.
//

import UIKit
import SnapKit

class PopularDishesView: UIView {

    private let dishes: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best I have ever eatten", image: "https://picsum.photos/100/200", calories: 42.54),
        .init(id: "id2", name: "Indomie", description: "This is the best I have ever eatten", image: "https://picsum.photos/100/200", calories: 324.23),
        .init(id: "id3", name: "Pizza", description: "This is the best I have ever eatten", image: "https://picsum.photos/100/200", calories: 534.98)
    ]
    
    private let customLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular Dishes"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let layout: UICollectionViewFlowLayout = {
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
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupViews()
        setupConstraints()
        registerCell()
    }
    
    private func registerCell() {
        customCollectionView.register(DishPortraitCollectionViewCell.self, forCellWithReuseIdentifier: DishPortraitCollectionViewCell.reuseId)
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

extension PopularDishesView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = customCollectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.reuseId, for: indexPath) as! DishPortraitCollectionViewCell
        cell.setupDish(dish: dishes[indexPath.row])
        return cell
    }
    
}
