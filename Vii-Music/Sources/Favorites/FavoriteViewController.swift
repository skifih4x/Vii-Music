//
//  FavoriteViewController.swift
//  Vii-Music
//
//  Created by Артем Орлов on 16.01.2023.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds, style: .plain)
        table.register(FavoritesCell.self, forCellReuseIdentifier: FavoritesCell.indentifier)
        table.backgroundColor = Theme.bgColor
        table.delegate = self
        table.dataSource = self
        table.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        table.rowHeight = 61
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        tableView.reloadData()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesCell.indentifier, for: indexPath) as? FavoritesCell else { return UITableViewCell() }
        cell.configure(model: "Songer Name")
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}



