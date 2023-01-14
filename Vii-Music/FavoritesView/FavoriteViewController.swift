//
//  PersonViewController.swift
//  Vii-Music
//
//  Created by Sergio on 9.01.23.
//

//import UIKit
//
//final class PersonViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .purple
//    }
//
//
//}
import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds, style: .plain)
        table.register(FavoritesCell.self, forCellReuseIdentifier: FavoritesCell.indentifier)
        table.delegate = self
        table.dataSource = self
        table.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        table.rowHeight = 100
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
         return cell
    }
}


