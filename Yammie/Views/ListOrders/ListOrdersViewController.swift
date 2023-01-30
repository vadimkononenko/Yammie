//
//  ListOrdersViewController.swift
//  Yammie
//
//  Created by Vadim Kononenko on 30.01.2023.
//

import UIKit
import SnapKit

class ListOrdersViewController: UIViewController {
    
    private let orders: [Order] = [
        .init(id: "id1", name: "Vadym Kononenko", dish: .init(id: "id1", name: "Fried Plantain", description: "This is my favourite dish", image: "https://picsum.photos/100/200", calories: 314)),
        .init(id: "id2", name: "Vasya Pupkin", dish: .init(id: "id1", name: "Beans and Garri", description: "This is my favourite dish", image: "https://picsum.photos/100/200", calories: 314)),
        .init(id: "id3", name: "Petro Petrovich", dish: .init(id: "id1", name: "Rice and Stew", description: "This is my favourite dish", image: "https://picsum.photos/100/200", calories: 314))
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

}

extension ListOrdersViewController {
    private func configure() {
        setupViews()
        setupConstraints()
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(DishListTableViewCell.self, forCellReuseIdentifier: DishListTableViewCell.reuseId)
    }
    
    private func setupViews() {
        title = "Orders"
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.reuseId) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(vc, animated: true)
    }
}
