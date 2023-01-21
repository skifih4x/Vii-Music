//
//  FirstSectionCell.swift
//  Vii-Music
//
//  Created by Alexander Altman on 19.01.2023.
//

import UIKit
import Kingfisher

class FirstSectionCell: UICollectionViewCell {
    
    private let firstSectionCellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "note")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.alpha = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Random Meal"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        backgroundTitleView.addSubview(titleLabel)
        
        addSubview(firstSectionCellImageView)
        addSubview(backgroundTitleView)
    }

    func configure(model: Tracks) {
        titleLabel.text = model.trackName
//        artistNameLabel.text = model.artistName
        guard let url = URL(string: model.artworkUrl100 ?? "") else { return }
        firstSectionCellImageView.kf.setImage(with: url)

    }
//    func configureCell(albumName: String, image: UIImage) {
//        titleLabel.text = albumName
//        firstSectionCellImageView.image = image
////        loader.getRecipeImage(stringUrl: imageName) { image in
////            self.firstSectionCellImageView.image = image
////        }
//    }
        
        func setConstraints() {
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: backgroundTitleView.topAnchor, constant: 8),
                titleLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 8),
                titleLabel.trailingAnchor.constraint(equalTo: backgroundTitleView.trailingAnchor, constant: -8),
                titleLabel.bottomAnchor.constraint(equalTo: backgroundTitleView.bottomAnchor, constant: -8),
                
                firstSectionCellImageView.topAnchor.constraint(equalTo: topAnchor),
                firstSectionCellImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                firstSectionCellImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                firstSectionCellImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                backgroundTitleView.bottomAnchor.constraint(equalTo: bottomAnchor),
                backgroundTitleView.leadingAnchor.constraint(equalTo: leadingAnchor),
                backgroundTitleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        }
    }
