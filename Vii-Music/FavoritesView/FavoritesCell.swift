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
    
    private lazy var button : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
    
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .none
        addSubview(button)

        addSubview(stacView)
                stacView.addArrangedSubview(label)
        stacView.addArrangedSubview(lableSecond)
        
        NSLayoutConstraint.activate([
            stacView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stacView.topAnchor.constraint(equalTo: topAnchor),
            stacView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            lableSecond.topAnchor.constraint(equalTo: label.bottomAnchor)
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
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant:.nextButtonBottomAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            button.leadingAnchor.constraint(equalTo: stacView.trailingAnchor, constant: 10),
            button.heightAnchor.constraint(equalToConstant: .nextButtonHeightAnchor),
            button.widthAnchor.constraint(equalToConstant: .nextButtonHeightAnchor)
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

    
    static let nextButtonBottomAnchor: CGFloat = 20
    static let nextButtonLeadingAnchor: CGFloat = 4
    static let nextButtonTrailingAnchor: CGFloat = 4
    static let nextButtonHeightAnchor : CGFloat = 6

}
