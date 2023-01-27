//
//  HomeViewController.swift
//  Yammie
//
//  Created by Vadim Kononenko on 22.01.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private lazy var foodCategoryView = CategoryView()
    private lazy var popularDishesView = PopularDishesView()
    private lazy var chefSpecialsView = SpecialsView()
    
    private lazy var barButton: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(systemName: "cart.circle.fill")
        btn.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension HomeViewController {
    private func configure() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        title = "Yammie"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = barButton
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(foodCategoryView)
        contentView.addSubview(popularDishesView)
        contentView.addSubview(chefSpecialsView)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(view)
        }
        foodCategoryView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(150)
        }
        popularDishesView.snp.makeConstraints { make in
            make.top.equalTo(foodCategoryView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(300)
        }
        chefSpecialsView.snp.makeConstraints { make in
            make.top.equalTo(popularDishesView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(120)
        }
    }
}
