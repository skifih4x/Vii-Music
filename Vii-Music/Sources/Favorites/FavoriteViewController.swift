//
//  FavoriteViewController.swift
//  Vii-Music
//
//  Created by Артем Орлов on 16.01.2023.
//

import UIKit

//protocol FavoriteViewControllerProtocol: AnyObject {
//    func getFavoriteTrack(track: String)
//}

class FavoriteViewController: UIViewController {

    // MARK: - Properties

    private var titles: [TitleItem] = [TitleItem]()
    var tracks = [Tracks]()
    lazy var vc = PlayViewController()
    let managerCoreData = DataPersistenceManager.shared

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
        fetchLocalStorageForFavorite()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

    private func fetchLocalStorageForFavorite() {
        managerCoreData.fetchingTitlesFromDataBase { [weak self] result in
            switch result {
            case .success(let items):
                self?.titles = items
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        61
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesCell.identifier, for: indexPath) as? FavoritesCell else {
            return UITableViewCell()
        }

        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(
            artistName: title.artistName ?? "artist",
            trackName: title.trackName ?? "track"))

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            switch editingStyle {
            case .delete:
                managerCoreData.deleteTitleWith(model: titles[indexPath.row]) { [weak self] result in
                    switch result {
                    case .success():
                        print("Deleted from the database")
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    self?.titles.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
            default:
                break;
            }
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

//        let track = tracks[indexPath.row]
//        let playerVC = PlayViewController()
//        playerVC.set(viewModel: track)
//        navigationController?.pushViewController(playerVC, animated: true)
    }
}

//extension FavoriteViewController: FavoriteViewControllerProtocol {
//    func getFavoriteTrack(track: String) {
//        trackArray.append(track)
//        tableView.reloadData()
//    }
//}
