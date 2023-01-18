//
//  FavoriteViewController.swift
//  Vii-Music
//
//  Created by Артем Орлов on 16.01.2023.
//

import UIKit

class FavoriteViewController: UIViewController {

    // MARK: - Properties

    private var titles: [TitleItem] = [TitleItem]()

    //MARK: - UIElements

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(FavoritesCell.self, forCellReuseIdentifier: FavoritesCell.identifier)
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        tableDelegate()
        setupNavigation()
        tableView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    private func setupNavigation() {
        navigationController?.navigationBar.isHidden = false
    }

    private func tableDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupHierarchy() {
        view.backgroundColor = Theme.bgColor
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        61
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesCell.identifier, for: indexPath) as? FavoritesCell else {
            return UITableViewCell()
        }

        //let title = titles[indexPath.row]
        cell.configure(model: "Songer Name")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
