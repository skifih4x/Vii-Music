//
//  FavoritesCell.swift
//  Vii-Music
//
//  Created by garpun on 12.01.2023.
//

import UIKit

class FavoritesCell: UITableViewCell {
    
    static let indentifier = "FavoritesCell"
    
    private lazy var stacView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    lazy var label: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textColor = .purple
        lable.backgroundColor = .red
        lable.text = "cell"
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()
    
    private lazy var lableSecond: UILabel = {
        let lableSecond = UILabel()
        lableSecond.translatesAutoresizingMaskIntoConstraints = false
        lableSecond.textColor = .red
        lableSecond.backgroundColor = .blue
        lableSecond.text = "lableSecond"
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .none
        addSubview(plaiImage)
        
        addSubview(stacView)
                stacView.addArrangedSubview(label)
        stacView.addArrangedSubview(lableSecond)
        
        NSLayoutConstraint.activate([
            stacView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stacView.topAnchor.constraint(equalTo: topAnchor),
            stacView.bottomAnchor.constraint(equalTo: bottomAnchor),

//            lableSecond.topAnchor.constraint(equalTo: label.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 30.1),
            lableSecond.widthAnchor.constraint(equalToConstant: 300),
            lableSecond.heightAnchor.constraint(equalToConstant: 30.1)
                   ])
//        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 70),
//            label.heightAnchor.constraint(equalToConstant: 20),
//            label.widthAnchor.constraint(equalToConstant: 100),
//            lableSecond.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
//            lableSecond.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -50),
//            lableSecond.heightAnchor.constraint(equalToConstant: 10),
//            lableSecond.widthAnchor.constraint(equalToConstant: 100)
//            ])
        NSLayoutConstraint.activate([
            plaiImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant:.nextButtonBottomAnchor),
            plaiImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            button.leadingAnchor.constraint(equalTo: stacView.trailingAnchor, constant: 10),
            plaiImage.heightAnchor.constraint(equalToConstant: .nextButtonHeightAnchor),
            plaiImage.widthAnchor.constraint(equalToConstant: .nextButtonHeightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: String) {
        label.text = model
    }
}
private extension CGFloat {

    
    static let nextButtonBottomAnchor: CGFloat = 15.5
    static let nextButtonLeadingAnchor: CGFloat = 4
    static let nextButtonTrailingAnchor: CGFloat = 4
    static let nextButtonHeightAnchor : CGFloat = 28

}
