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
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Track name"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var playButton: UIButton = {
       let button = UIButton()
//        button.imageView?.image = UIImage(systemName: "play.circle")
        button.backgroundColor = .yellow
        button.setImage(UIImage(systemName: "play.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 5
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
        backgroundColor = .blue
//        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        
        addSubview(secondSectionCellImageView)
        
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
        
        addSubview(playButton)
    }
    
    func configureCell(albumName: String, image: UIImage, button: UIButton) {
//        titleLabel.text = albumName
        secondSectionCellImageView.image = image
//        playButton = button
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            secondSectionCellImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            secondSectionCellImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            secondSectionCellImageView.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -20),
            secondSectionCellImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            secondSectionCellImageView.heightAnchor.constraint(equalToConstant: 25),
            secondSectionCellImageView.widthAnchor.constraint(equalToConstant: 25),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: secondSectionCellImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -5),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            playButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            playButton.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 5),
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            

        ])
    }
}
