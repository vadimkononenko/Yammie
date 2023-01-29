//
//  DetailViewController.swift
//  Yammie
//
//  Created by Vadim Kononenko on 27.01.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var dish: Dish!
    
    private lazy var detailView = DetailView(dish: self.dish)

    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }

}
