//
//  OnboardingCollectionViewCell.swift
//  Yammie
//
//  Created by Vadim Kononenko on 18.01.2023.
//

import UIKit
import SnapKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "OnboardingCollectionViewCell"
    
    lazy var slideImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var slideTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Quick Delivery At Your Doorstep"
        label.font = UIFont.systemFont(ofSize: 31, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var slideDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Home delivery and Online reservation system for restaurants and cafes"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func setupCell(slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
    private func configure() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(slideImageView)
        addSubview(slideTitleLabel)
        addSubview(slideDescriptionLabel)
    }
    
    private func setupConstraints() {
        slideImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(self.frame.height * 0.7)
        }
        slideTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(slideImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
        }
        slideDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(slideTitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
