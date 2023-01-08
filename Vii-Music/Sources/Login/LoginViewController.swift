//
//  ViewController.swift
//  Vii-Music
//
//  Created by Артем Орлов on 08.01.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    //MARK: - UIElements

    private let logoImage: UIImageView = {
        let image = UIImage(named: "logoBackground")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    //MARK: - Setup

    func setupHierarchy() {
        view.addSubview(logoImage)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor),
            logoImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
