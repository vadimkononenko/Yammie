//
//  CategoryCollectionViewCell.swift
//  Yammie
//
//  Created by Vadim Kononenko on 23.01.2023.
//

import UIKit
import SnapKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = String(describing: CategoryCollectionViewCell.self)
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = false
        self.layer.borderColor = UIColor(white: 0.6, alpha: 0.3).cgColor
        self.layer.borderWidth = 0.7
        self.layer.cornerRadius = 10
    }
    
    func setup(category: DishCategory) {
        label.text = category.name
        imageView.kf.setImage(with: category.image?.asUrl)
    }
    
}

extension CategoryCollectionViewCell {
    private func configure() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.addSubview(imageView)
        self.addSubview(label)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.centerY.equalTo(self.snp.centerY)
            make.width.height.equalTo(40)
        }
        label.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.centerY.equalTo(imageView)
        }
    }
}
