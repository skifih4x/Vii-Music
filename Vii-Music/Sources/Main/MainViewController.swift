//
//  MainViewController.swift
//  Vii-Music
//
//  Created by Sergio on 8.01.23.
//

import UIKit

 class MainViewController: UIViewController {
    
    let manager = MusicManager()
    var tracks = [Tracks]()

    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = Theme.bgColor
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var sections = MockData.shared.pageData
    private var firstSection: [ListItem]?
    private var secondSection: [ListItem]?
    
    

    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, PUT-USER-Name"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let headerSubLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you want to hear today?"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let headerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 10.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

     lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
        searchBar.searchTextField.layer.masksToBounds = true
         searchBar.delegate = self
         searchBar.showsCancelButton = true
         searchBar.setShowsCancelButton(false, animated: true)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

     lazy var tableView: UITableView = {
         let table = UITableView()
         table.translatesAutoresizingMaskIntoConstraints = false
         table.delegate = self
         table.dataSource = self
         table.backgroundColor = Theme.bgColor
         table.showsVerticalScrollIndicator = false
         table.register(SearchCell.self, forCellReuseIdentifier: SearchCell.identifier)
         return table
     }()

    let segmentedCOntrolItems = ["For you", "Trending", "Rock music", "Classic"]
    let haptic = UISelectionFeedbackGenerator()

    lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: segmentedCOntrolItems)
        view.selectedSegmentIndex = 0
        view.backgroundColor = .white
        view.apportionsSegmentWidthsByContent = true
        view.selectedSegmentTintColor = Theme.brightGreen
        view.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        haptic.prepare()
        setDelegates()
        tableView.isHidden = true
    }
    func setupViews() {
        
        view.backgroundColor = Theme.bgColor

        view.addSubview(headerStackView)
        view.addSubview(searchBar)

        headerStackView.addArrangedSubview(headerLabel)
        headerStackView.addArrangedSubview(headerSubLabel)
        
        view.addSubview(segmentedControl)
        
        view.addSubview(collectionView)
        view.addSubview(tableView)
        collectionView.register(FirstSectionCell.self, forCellWithReuseIdentifier: "FirstSectionCell")
        collectionView.register(SecondSectionCell.self, forCellWithReuseIdentifier: "SecondSectionCell")
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        collectionView.collectionViewLayout = createLayout()
    }
     
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
//         navigationController?.navigationBar.isHidden = true
         navigationController?.isNavigationBarHidden = true
     }

    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @objc func indexChanged() {
        haptic.selectionChanged()
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("1")
        case 1:
            print("2")
        case 2:
            print("3")
        default:
            print("4")
        }
    }

    func setConstraints() {
        NSLayoutConstraint.activate([

            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerStackView.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -20),

            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //            searchBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -500),
            searchBar.heightAnchor.constraint(equalToConstant: 40),

            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            segmentedControl.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 30),

            collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)


        ])
    }


}

//MARK: - SongFetching for Searching
#warning ("метод для фетча трека для таблицы поиска")
//extension MainViewController {
//
//    func fetchSong(songName: String) {
//        let urlString = "https://itunes.apple.com/search?entity=song&term=\(songName)"
//        print(urlString)
//        NetworkFetch.shared.songFetch(urlString: urlString) { [weak self] trackModel, error in
//            if error == nil {
//                guard let trackModel = trackModel else {return}
//                self?.tracks = trackModel.results
//                self?.tableView.reloadData()
//            } else {
//                print(error!.localizedDescription)
//            }
//        }
//    }
//}

extension MainViewController {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            
            let section = self.sections[sectionIndex]
            switch section {
            case .first(_):
                return self.createFirstSection()
            case .second(_):
                return self.createSecondSection()
            }
        }
    }
    
    private func createLayoutSection(
        group: NSCollectionLayoutGroup,
        behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
        intergrouupSpacing: CGFloat,
        supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
        contentInsets: Bool
    ) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = intergrouupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }
    
    
    private func createFirstSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.47),
                heightDimension: .fractionalWidth(0.5)
            ),
            subitems: [item]
        )
        
        let section = createLayoutSection(
            group: group,
            behavior: .groupPaging,
            intergrouupSpacing: 10,
            supplementaryItems: [supplementaryHeaderItem()],
            contentInsets: false
        )
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    private func createSecondSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(50)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(1)
            ),
            subitems: [item]
        )
        
        let section = createLayoutSection(
            group: group,
            behavior: .none,
            intergrouupSpacing: 10,
            supplementaryItems: [supplementaryHeaderItem()],
            contentInsets: false
        )
        section.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(40)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }
}
    

//extension MainViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//    }

//MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate { }

//MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .first(let first):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSectionCell", for: indexPath) as? FirstSectionCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(albumName: first[indexPath.row].title, image: first[indexPath.row].image)
            return cell
            
            
        case .second(let second):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondSectionCell", for: indexPath) as? SecondSectionCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(albumName: second[indexPath.row].title, image: second[indexPath.row].image, button: second[indexPath.row].button!)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(sections[indexPath.section].items[indexPath.row].id!)
        
//        let vc =
//        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "HeaderSupplementaryView",
                for: indexPath
            ) as! HeaderSupplementaryView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - TableView DataSource&Delegate

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier, for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }


}

// MARK: - SearchDelegate

extension MainViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.isHidden = false
        searchBar.setShowsCancelButton(true, animated: true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableView.isHidden =  true
//        self.searchBar.resignFirstResponder()
//        self.searchBar.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)

        // Remove focus from the search bar.
        searchBar.endEditing(true)
    }
}




import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }

    struct ContainterView: UIViewControllerRepresentable {
        let listVC = MainViewController()
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<ListProvider.ContainterView>) -> MainViewController {
            return listVC
        }

        func updateUIViewController(_ uiViewController:
                                    ListProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<ListProvider.ContainterView>) {
        }
    }
}

