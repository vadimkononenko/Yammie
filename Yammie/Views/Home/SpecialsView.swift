//
//  SpecialsView.swift
//  Yammie
//
//  Created by Vadim Kononenko on 26.01.2023.
//

import UIKit
import SnapKit

class SpecialsView: UIView {

    private let specials: [Dish] = [
        .init(id: "id1", name: "Fried Plantain", description: "This is my favourite dish", image: "https://picsum.photos/100/200", calories: 314),
        .init(id: "id2", name: "Beans and Garri", description: "This is my favourite dish", image: "https://picsum.photos/100/200", calories: 1004)
    ]
    
    private let customLabel: UILabel = {
        let label = UILabel()
        label.text = "Chef's Specials"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let customCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
        customCollectionView.register(DishLandscapeCollectionViewCell.self, forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.reuseId)
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

extension SpecialsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return specials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = customCollectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.reuseId, for: indexPath) as! DishLandscapeCollectionViewCell
        cell.setup(dish: specials[indexPath.row])
        return cell
    }
    
}

extension SpecialsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: customCollectionView.frame.width/1.5, height: customCollectionView.frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
    }
}
