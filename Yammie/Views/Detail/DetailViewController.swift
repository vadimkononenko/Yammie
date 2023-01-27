//
//  DetailViewController.swift
//  Yammie
//
//  Created by Vadim Kononenko on 27.01.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }

}
