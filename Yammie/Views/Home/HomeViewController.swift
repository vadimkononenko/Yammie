//
//  HomeViewController.swift
//  Yammie
//
//  Created by Vadim Kononenko on 22.01.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let categories = DishCategory.fetchCategories()
    private let populars = Dish.fetchPopulars()
    private let specials = Dish.fetchSpecials()
    
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
    
    private lazy var barButton: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.image = UIImage(systemName: "cart.circle.fill")
        btn.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return btn
    }()
    
    private let foodCategoryLabel = UILabel.createSectionLabel(name: "Food Category")
    private let popularDishesLabel = UILabel.createSectionLabel(name: "Popular Dishes")
    private let chefSpecialsLabel = UILabel.createSectionLabel(name: "Chef's Special")
    
    private let foodCategoryCollectionView = UICollectionView.createHorizontalCollectionView()
    private let popularDishCollectionView = UICollectionView.createHorizontalCollectionView()
    private let chefSpecialsCollectionView = UICollectionView.createHorizontalCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension HomeViewController {
    private func configure() {
        setupViews()
        setupConstraints()
        registerCells()
    }
    
    private func setupViews() {
        title = "Yammie"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = barButton
        
        foodCategoryCollectionView.delegate = self
        foodCategoryCollectionView.dataSource = self
        
        popularDishCollectionView.delegate = self
        popularDishCollectionView.dataSource = self
        
        chefSpecialsCollectionView.delegate = self
        chefSpecialsCollectionView.dataSource = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(foodCategoryLabel)
        contentView.addSubview(popularDishesLabel)
        contentView.addSubview(chefSpecialsLabel)
        contentView.addSubview(foodCategoryCollectionView)
        contentView.addSubview(popularDishCollectionView)
        contentView.addSubview(chefSpecialsCollectionView)
    }
    
    private func registerCells() {
        foodCategoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseId)
        popularDishCollectionView.register(DishPortraitCollectionViewCell.self, forCellWithReuseIdentifier: DishPortraitCollectionViewCell.reuseId)
        chefSpecialsCollectionView.register(DishLandscapeCollectionViewCell.self, forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.reuseId)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
        
        foodCategoryLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(contentView.snp.trailing)
            make.height.equalTo(30)
        }
        foodCategoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(foodCategoryLabel.snp.bottom)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(120)
        }
        
        popularDishesLabel.snp.makeConstraints { make in
            make.top.equalTo(foodCategoryCollectionView.snp.bottom)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(contentView.snp.trailing)
            make.height.equalTo(30)
        }
        popularDishCollectionView.snp.makeConstraints { make in
            make.top.equalTo(popularDishesLabel.snp.bottom)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(300)
        }
        
        chefSpecialsLabel.snp.makeConstraints { make in
            make.top.equalTo(popularDishCollectionView.snp.bottom)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(contentView.snp.trailing)
            make.height.equalTo(30)
        }
        chefSpecialsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(chefSpecialsLabel.snp.bottom)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(100)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case foodCategoryCollectionView:
            return categories.count
        case popularDishCollectionView:
            return populars.count
        case chefSpecialsCollectionView:
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case foodCategoryCollectionView:
            let cell = foodCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularDishCollectionView:
            let cell = popularDishCollectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.reuseId, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setupDish(dish: populars[indexPath.row])
            return cell
        case chefSpecialsCollectionView:
            let cell = chefSpecialsCollectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.reuseId, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == foodCategoryCollectionView {
            
        } else {
            let vc = DetailViewController()
            vc.dish = collectionView == popularDishCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case foodCategoryCollectionView:
            return CGSize(width: foodCategoryCollectionView.frame.width/2.5, height: foodCategoryCollectionView.frame.height/2 - 10)
        case popularDishCollectionView:
            return CGSize(width: popularDishCollectionView.frame.width/2.5, height: popularDishCollectionView.frame.height - 10)
        case chefSpecialsCollectionView:
            return CGSize(width: chefSpecialsCollectionView.frame.width/1.5, height: chefSpecialsCollectionView.frame.height - 10)
        default: return CGSize()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
    }
}
