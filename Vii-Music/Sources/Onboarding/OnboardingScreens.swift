//
//  OnboardingScreens.swift
//  Vii-Music
//
//  Created by Alexander Altman on 10.01.2023.
//

import UIKit

class OnboardingScreens: UIView {
    
    private let pageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.white
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pageSubLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.white
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pageImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "OnboardingImage01")
        //        image.layer.cornerRadius = image.bounds.height / 2
        image.layer.cornerRadius = 103.5
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        image.layer.borderColor = Theme.bgColor.cgColor
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let doneButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = Theme.brightGreen.cgColor
        button.setTitle("Done", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let skipButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = Theme.brightGreen.cgColor
        button.setTitle("Skip", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pageImage)
        addSubview(pageLabel)
        addSubview(pageSubLabel)
        addSubview(doneButton)
        addSubview(skipButton)
        setConstraints()
        
        print(pageImage.frame.size.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setPageLabelText(text: String) {
        pageLabel.text = text
    }
    
    public func setPageSubLabelText(text: String) {
        pageSubLabel.text = text
    }
    
    public func setPageImage(image: UIImage) {
        pageImage.image = image
    }
    
    public func setLabelColor() {
        pageLabel.textColor = Theme.brightGreen
        pageSubLabel.textColor = Theme.brightGreen
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            pageImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageImage.bottomAnchor.constraint(equalTo: pageLabel.topAnchor, constant: -Theme.spacing),
            
            pageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Theme.spacing),
            pageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Theme.spacing),
            pageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            pageLabel.heightAnchor.constraint(equalToConstant: 100),
            
            pageSubLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Theme.spacing),
            pageSubLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Theme.spacing),
            pageSubLabel.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: Theme.spacing),
            pageSubLabel.heightAnchor.constraint(equalToConstant: 75),
            
            doneButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Theme.spacing),
            doneButton.widthAnchor.constraint(equalToConstant: 100),
            doneButton.heightAnchor.constraint(equalToConstant: 30),
            
            skipButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            skipButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Theme.spacing),
            skipButton.widthAnchor.constraint(equalToConstant: 100),
            skipButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
}
