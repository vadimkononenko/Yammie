//
//  OnboardingSlide.swift
//  Yammie
//
//  Created by Vadim Kononenko on 18.01.2023.
//

import UIKit

struct OnboardingSlide {
    let title: String
    let description: String
    let image: UIImage
    
    static func fetchSlides() -> [OnboardingSlide] {
        let firstSlide = OnboardingSlide(title: "First slide", description: "Description for first slide", image: UIImage(named: "slide1")!)
        let secondSlide = OnboardingSlide(title: "Second slide", description: "Description for second slide", image: UIImage(named: "slide2")!)
        let thirdSlide = OnboardingSlide(title: "Third slide", description: "Description for third slide", image: UIImage(named: "slide3")!)
        return [firstSlide, secondSlide, thirdSlide]
    }
}
