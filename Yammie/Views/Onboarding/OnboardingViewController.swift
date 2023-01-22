//
//  OnboardingViewController.swift
//  Yammie
//
//  Created by Vadim Kononenko on 18.01.2023.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    private var slides: [OnboardingSlide] = OnboardingSlide.fetchSlides()
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    //MARK: - UI elements
    private let onboardingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageCtrl = UIPageControl()
        pageCtrl.currentPage = 0
        pageCtrl.currentPageIndicatorTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        pageCtrl.pageIndicatorTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        pageCtrl.numberOfPages = slides.count
        return pageCtrl
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.reuseId)
        
        onboardingCollectionView.showsHorizontalScrollIndicator = false
        onboardingCollectionView.showsVerticalScrollIndicator = false
        onboardingCollectionView.isPagingEnabled = true
        
        configure()
    }
    
    private func configure() {
        setupViews()
        setupConstraints()
    }
    
    @objc private func nextButtonClicked() {
        if currentPage == slides.count - 1 {
            let homeVC = HomeViewController()
            let nav = UINavigationController(rootViewController: homeVC)
            
            nav.modalPresentationStyle = .fullScreen
            nav.modalTransitionStyle = .flipHorizontal
            
            present(nav, animated: true)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(onboardingCollectionView)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
    }
    
    private func setupConstraints() {
        onboardingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.bounds.height * 0.7)
        }
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(nextButton.snp.top).offset(-10)
            make.centerX.equalTo(onboardingCollectionView)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.centerX.equalTo(pageControl)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onboardingCollectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.reuseId, for: indexPath) as! OnboardingCollectionViewCell
        cell.setupCell(slide: slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: onboardingCollectionView.frame.width, height: onboardingCollectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
