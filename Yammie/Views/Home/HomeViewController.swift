//
//  HomeViewController.swift
//  Yammie
//
//  Created by Vadim Kononenko on 22.01.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var foodCategoryView = CategoryView(categoryName: "Food Category")
    private lazy var popularDishesView = CategoryView(categoryName: "Popular Dishes")
    private lazy var chefSpecialsView = CategoryView(categoryName: "Chef's Specials")
    
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
        
        scrollView.addSubview(foodCategoryView)
        scrollView.addSubview(popularDishesView)
        scrollView.addSubview(chefSpecialsView)
        
        view.addSubview(scrollView)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        foodCategoryView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(150)
        }
        popularDishesView.snp.makeConstraints { make in
            make.top.equalTo(foodCategoryView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(300)
        }
        chefSpecialsView.snp.makeConstraints { make in
            make.top.equalTo(popularDishesView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(150)
        }
    }
}
