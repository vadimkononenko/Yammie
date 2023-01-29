//
//  DetailView.swift
//  Yammie
//
//  Created by Vadim Kononenko on 27.01.2023.
//

import UIKit
import SnapKit

class DetailView: UIView {

    var dish: Dish!
    
    private let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let detailStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private let caloriesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        return textField
    }()
    
    private lazy var orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Place Order", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(order), for: .touchUpInside)
        return button
    }()
    
    convenience init(dish: Dish) {
        self.init()
        self.dish = dish
        populateView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func order() {
        
    }
    
    private func populateView() {
        detailImageView.kf.setImage(with: dish.image?.asUrl)
        nameLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }
    
}

extension DetailView {
    private func configure() {
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(detailImageView)
        addSubview(detailStackView)
        
        detailStackView.addArrangedSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(nameLabel)
        horizontalStackView.addArrangedSubview(caloriesLabel)
        
        detailStackView.addArrangedSubview(descriptionLabel)
        detailStackView.addArrangedSubview(textField)
        detailStackView.addArrangedSubview(orderButton)
    }
    
    private func setupConstraints() {
        detailImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(550)
        }
        detailStackView.snp.makeConstraints { make in
            make.top.equalTo(detailImageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.bottom.equalTo(self.safeAreaLayoutGuide).offset(-8)
        }
        orderButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
}
