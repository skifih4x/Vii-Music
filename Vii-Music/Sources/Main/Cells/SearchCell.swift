//
//  SearchCell.swift
//  Vii-Music
//
//  Created by Артем Орлов on 20.01.2023.
//

import UIKit

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
        let trackImage = UIImage(named: "plaiImage1")
        let imageView = UIImageView(image: trackImage)
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
        addSubview(trackImage)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            trackNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            trackNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3.5),

            artistNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            artistNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3.5),

            trackImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant:.nextButtonBottomAnchor),
            trackImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            trackImage.heightAnchor.constraint(equalToConstant: .nextButtonHeightAnchor),
            trackImage.widthAnchor.constraint(equalToConstant: .nextButtonHeightAnchor)
        ])
    }

    func configure(model: String) {
        trackNameLabel.text = model
        artistNameLabel.text = model
    }
}

private extension CGFloat {
    static let nextButtonBottomAnchor: CGFloat = 10
    static let nextButtonLeadingAnchor: CGFloat = 4
    static let nextButtonTrailingAnchor: CGFloat = 4
    static let nextButtonHeightAnchor : CGFloat = 28
}


