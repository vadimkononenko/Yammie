//
//  DishListTableViewCell.swift
//  Yammie
//
//  Created by Vadim Kononenko on 29.01.2023.
//

import UIKit
import SnapKit

class DishListTableViewCell: UITableViewCell {
    
    static let reuseId = String(describing: DishListTableViewCell.self)

    private let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let dishTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private let dishDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishTitleLabel.text = dish.name
        dishDescriptionLabel.text = dish.description
    }
    
}

extension DishListTableViewCell {
    private func configure() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.backgroundColor = .clear
        self.selectionStyle = .none

        self.addSubview(cellView)
        cellView.addSubview(dishImageView)
        cellView.addSubview(stackView)
        stackView.addArrangedSubview(dishTitleLabel)
        stackView.addArrangedSubview(dishDescriptionLabel)
    }
    
    private func setupConstraints() {
        cellView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-10)
        }
        dishImageView.snp.makeConstraints { make in
            make.leading.equalTo(cellView).offset(10)
            make.top.equalTo(cellView).offset(10)
            make.bottom.equalTo(cellView).offset(-10)
            make.width.height.equalTo(50)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(dishImageView.snp.top)
            make.bottom.equalTo(dishImageView.snp.bottom)
            make.leading.equalTo(dishImageView.snp.trailing).offset(16)
            make.trailing.equalTo(cellView.snp.trailing).offset(-16)
        }
    }
}
