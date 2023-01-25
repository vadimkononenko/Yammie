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
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 10, height: 20)
        self.layer.shadowRadius = 50
        
//        cellView.layer.shadowColor = UIColor.black.cgColor
//        cellView.layer.shadowOffset = CGSize(width: 5, height: 8)
//        cellView.layer.cornerRadius = 10
//        cellView.layer.shadowOpacity = 0.2
//        cellView.layer.shadowRadius = 5
//        cellView.clipsToBounds = false
    }
    
    func setup(category: DishCategory) {
        label.text = category.name
        imageView.kf.setImage(with: category.image.asUrl)
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
            make.trailing.equalTo(self.snp.trailing).offset(-8)
            make.centerY.equalTo(imageView)
        }
    }
}
