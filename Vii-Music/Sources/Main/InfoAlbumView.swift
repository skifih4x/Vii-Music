//
//  InfoAlbumView.swift
//  Vii-Music
//
//  Created by Sergio on 17.01.23.
//

import UIKit

class InfoAlbumView: UIView {

    // MARK: - Properties

    static let identifier = "FavoritesCell"

    //MARK: - UIElements

    private let logoImage : UIImageView = {
        let image = UIImage(named: "logoBackground")
        let imageView = UIImageView(image: image)
        //imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var trackLabel = UILabel(text: "Track", size: 16, textColor: .white)

    private lazy var artistNameLabel = UILabel(text: "Artist",size: 16, textColor: .white)

    private lazy var ageTrackLabel = UILabel(text: "Age", size: 16, textColor: .white)

    let tableView: UITableView = {
        let table = UITableView()
        table.register(FavoritesCell.self, forCellReuseIdentifier: FavoritesCell.identifier)
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    //MARK: - LifeCycle

    init() {
        super.init(frame: .zero)
        backgroundColor = Theme.bgColor
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup

    func setupHierarchy() {
        addSubview(logoImage)
        addSubview(trackLabel)
        addSubview(artistNameLabel)
        addSubview(ageTrackLabel)
        addSubview(tableView)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 90),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            logoImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            logoImage.heightAnchor.constraint(equalToConstant: 240),

            trackLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 15),
            trackLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            artistNameLabel.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: 8),
            artistNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            ageTrackLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 8),
            ageTrackLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            tableView.topAnchor.constraint(equalTo: ageTrackLabel.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

//    func configure(model: String) {
//        trackLabel.text = model
//        artistNameLabel.text = model
//        ageTrackLabel.text = model
//    }
}
