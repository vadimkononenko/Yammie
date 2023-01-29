//
//  ListDishesViewController.swift
//  Yammie
//
//  Created by Vadim Kononenko on 29.01.2023.
//

import UIKit
import SnapKit

class ListDishesViewController: UIViewController {
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best I have ever eatten", image: "https://picsum.photos/100/200", calories: 42.54),
        .init(id: "id2", name: "Indomie", description: "This is the best I have ever eatten", image: "https://picsum.photos/100/200", calories: 324.23),
        .init(id: "id3", name: "Pizza", description: "This is the best I have ever eatten", image: "https://picsum.photos/100/200", calories: 534.98)
    ]
    
    var category: DishCategory!
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

}

extension ListDishesViewController {
    private func configure() {
        setupViews()
        setupConstraints()
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(DishListTableViewCell.self, forCellReuseIdentifier: DishListTableViewCell.reuseId)
    }
    
    private func setupViews() {
        title = category.name
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.reuseId) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.dish = dishes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
