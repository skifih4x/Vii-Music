//
//  FavoritesCell.swift
//  Vii-Music
//
//  Created by Артем Орлов on 16.01.2023.
//

import UIKit

class FavoritesCell: UITableViewCell {

    // MARK: - Properties
    
    static let identifier = "FavoritesCell"

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

    private lazy var plaiImage : UIImageView = {
        let plaiImage = UIImage(named: "plaiImage1")
        let imageView = UIImageView(image: plaiImage)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    //MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Theme.bgColor
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
        addSubview(plaiImage)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            trackNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            trackNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),

            artistNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            artistNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),

            plaiImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant:.nextButtonBottomAnchor),
            plaiImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            plaiImage.heightAnchor.constraint(equalToConstant: .nextButtonHeightAnchor),
            plaiImage.widthAnchor.constraint(equalToConstant: .nextButtonHeightAnchor)
        ])
    }

    func configure(model: String) {
        trackNameLabel.text = model
        artistNameLabel.text = model
    }
}

private extension CGFloat {
    static let nextButtonBottomAnchor: CGFloat = 15.5
    static let nextButtonLeadingAnchor: CGFloat = 4
    static let nextButtonTrailingAnchor: CGFloat = 4
    static let nextButtonHeightAnchor : CGFloat = 28
}
