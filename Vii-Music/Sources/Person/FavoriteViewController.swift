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

    var myTableView = UITableView()
    let indentifire = "MyCell"
    let avatar = "Avatar.png"
    var avatarlView = UIImageView()
    let myTableViewTopAncor: CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        createLabel()
        
        view.backgroundColor = .purple
    }
    
    func createLabel() {
        let image = UIImage(named: avatar)
        avatarlView = UIImageView(image: image!)
        avatarlView.frame = CGRect(x: 100, y: 50, width: 200, height: 200)
        view.addSubview(avatarlView)
        avatarlView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        avatarlView.frame = CGRect(x: 137, y: 56, width: 124, height: 124)
    }

    
    func createTable() {
        self.myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(myTableView)
        myTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        myTableView.topAnchor.constraint(equalTo: avatarlView.topAnchor, constant: myTableViewTopAncor)


    }
    //MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 5
        case 2:
            return 8
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        cell.textLabel?.text = "section = \(indexPath.section) cell = \(indexPath.row)"
        return cell
    }
    //MARK: - UITableViewDelegate
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}


private extension CGFloat {
        
        static let myTableViewTopAncor: CGFloat = 40
        static let myTableViewHeightAnchor: CGFloat = 80.0

        
    }
