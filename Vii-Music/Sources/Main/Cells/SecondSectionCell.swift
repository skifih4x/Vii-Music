//
//  SecondSectionCell.swift
//  Vii-Music
//
//  Created by Alexander Altman on 19.01.2023.
//

import UIKit

class SecondSectionCell: UICollectionViewCell {
    
    private let secondSectionCellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "note")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Artist name"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 12)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Track name"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var playImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "play.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        imageView.tintColor = Theme.brightGreen
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let separator: UIView = {
       let separator = UIView()
        separator.backgroundColor = .white
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private let stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.alignment = .leading
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .gray
//        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.cornerRadius = 10
        
        
        addSubview(secondSectionCellImageView)
        
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(separator)
        stackView.addArrangedSubview(subTitleLabel)
        
        addSubview(playImage)
    }
    
    func configureCell(albumName: String, image: UIImage, button: UIImage) {
//        titleLabel.text = albumName
        secondSectionCellImageView.image = image
//        playButton = button
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            secondSectionCellImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            secondSectionCellImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            secondSectionCellImageView.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -40),
            secondSectionCellImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            secondSectionCellImageView.heightAnchor.constraint(equalToConstant: 25),
            secondSectionCellImageView.widthAnchor.constraint(equalToConstant: 25),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
//            stackView.leadingAnchor.constraint(equalTo: secondSectionCellImageView.trailingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: playImage.leadingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.widthAnchor.constraint(equalToConstant: 200),
            
            playImage.topAnchor.constraint(equalTo: topAnchor, constant: 15),
//            playButton.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 40),
            playImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            playImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
//            playButton.heightAnchor.constraint(equalToConstant: 25),
            playImage.widthAnchor.constraint(equalToConstant: 25)
//

        ])
    }
}
