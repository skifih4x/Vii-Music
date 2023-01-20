//
//  SearchCell.swift
//  Vii-Music
//
//  Created by Артем Орлов on 20.01.2023.
//

import UIKit
import Kingfisher

final class SearchCell: UITableViewCell {
    // MARK: - Properties
    
    static let identifier = "SearchCell"

    //MARK: - UIElements
    
    lazy var trackNameLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textColor = #colorLiteral(red: 0.1194838211, green: 0.8408789635, blue: 0.9539651275, alpha: 1)
        lable.text = "Name track"
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    private lazy var artistNameLabel: UILabel = {
        let lableSecond = UILabel()
        lableSecond.translatesAutoresizingMaskIntoConstraints = false
        lableSecond.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lableSecond.text = "Artist"
        lableSecond.adjustsFontSizeToFitWidth = true
        return lableSecond
    }()
    
    private lazy var trackImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Theme.bgColor
        selectionStyle = .none
        setupHierarchy()
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup
    
    func setupHierarchy() {
        addSubview(trackNameLabel)
        addSubview(artistNameLabel)
        addSubview(trackImage)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([

            trackImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant:.nextButtonBottomAnchor),
            trackImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            trackImage.heightAnchor.constraint(equalToConstant: 50),
            trackImage.widthAnchor.constraint(equalToConstant: 50),

            trackNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            trackNameLabel.leadingAnchor.constraint(equalTo: trackImage.trailingAnchor, constant: 10),


            artistNameLabel.leadingAnchor.constraint(equalTo: trackImage.trailingAnchor, constant: 10),
            artistNameLabel.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 3.5)

        ])
    }

    func configure(model: Tracks) {
        trackNameLabel.text = model.trackName
        artistNameLabel.text = model.artistName
        guard let url = URL(string: model.artworkUrl100 ?? "") else { return }
        trackImage.kf.setImage(with: url)

    }
}

private extension CGFloat {
    static let nextButtonBottomAnchor: CGFloat = 10
    static let nextButtonLeadingAnchor: CGFloat = 4
    static let nextButtonTrailingAnchor: CGFloat = 4
    static let nextButtonHeightAnchor : CGFloat = 28
}

import SwiftUI

struct PeopleVCProvider: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 13 Pro Max")
    }

    struct Container: UIViewControllerRepresentable {

        let tabBarVC = MainTabBarViewController()

        func makeUIViewController(context: Context) -> some UIViewController {
            tabBarVC
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}

