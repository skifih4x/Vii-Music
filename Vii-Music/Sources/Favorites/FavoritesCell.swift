//
//  FavoritesCell.swift
//  Vii-Music
//
//  Created by Артем Орлов on 16.01.2023.
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
        lable.textColor = #colorLiteral(red: 0.1194838211, green: 0.8408789635, blue: 0.9539651275, alpha: 1)
        lable.text = "cell"
        lable.adjustsFontSizeToFitWidth = true
        return lable
    }()

    private lazy var lableSecond: UILabel = {
        let lableSecond = UILabel()
        lableSecond.translatesAutoresizingMaskIntoConstraints = false
        lableSecond.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
        backgroundColor = Theme.bgColor
        addSubview(plaiImage)

        addSubview(stacView)
                stacView.addArrangedSubview(label)
        stacView.addArrangedSubview(lableSecond)

        NSLayoutConstraint.activate([
            stacView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stacView.topAnchor.constraint(equalTo: topAnchor),
            stacView.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 30.1),
            lableSecond.widthAnchor.constraint(equalToConstant: 300),
            lableSecond.heightAnchor.constraint(equalToConstant: 30.1)
                   ])

        NSLayoutConstraint.activate([
            plaiImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant:.nextButtonBottomAnchor),
            plaiImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
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
