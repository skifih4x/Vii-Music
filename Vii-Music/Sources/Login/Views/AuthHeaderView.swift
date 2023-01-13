//
//  AuthHeaderView.swift
//  Vii-Music
//
//  Created by Sergio on 12.01.23.
//

import UIKit

final class AuthHeaderView: UIView {

    //MARK: - UIElements

    private lazy var logoNote: UIImageView = {
        let image = UIImage(named: "note")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel = UILabel(text: "error", size: 24, textColor: .systemTeal)

    private lazy var subTitleLabel = UILabel(text: "error",size: 30, textColor: .white)

    //MARK: - LifeCycle

    init(title: String, subTitle: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        backgroundColor = .clear
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup

    private func setupHierarchy() {
        addSubview(logoNote)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            logoNote.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            logoNote.centerXAnchor.constraint(equalTo: centerXAnchor),

            titleLabel.topAnchor.constraint(equalTo: logoNote.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
