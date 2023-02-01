//
//  InfoAlbomViewController.swift
//  Vii-Music
//
//  Created by Sergio on 17.01.23.
//

import UIKit

class InfoAlbumViewController: UIViewController {

    // MARK: - Properties

    //MARK: - LifeCycle

    private var infoAlbumView: InfoAlbumView? {
        guard isViewLoaded else { return nil }
        return view as? InfoAlbumView
    }

    override func loadView() {
        super.loadView()
        view = InfoAlbumView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        tableDelegate()
        //setupNavigation()
    }

//    private func setupNavigation() {
//        navigationController?.navigationBar.isHidden = false
//    }

    private func tableDelegate() {
        infoAlbumView?.tableView.delegate = self
        infoAlbumView?.tableView.dataSource = self
    }

    private func setupHierarchy() {
        view.backgroundColor = Theme.bgColor
    }
}

// MARK: - UITableViewDataSource

extension InfoAlbumViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesCell.identifier, for: indexPath) as? FavoritesCell else {
            return UITableViewCell()
        }

        //let title = titles[indexPath.row]
        //cell.configure(model: "Songer Name")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
