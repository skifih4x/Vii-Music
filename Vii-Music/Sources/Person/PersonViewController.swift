//
//  PersonViewController.swift
//  Vii-Music
//
//  Created by Sergio on 9.01.23.
//

import UIKit

final class PersonViewController: UIViewController {

    //MARK: - UIElements

    private lazy var personNameLabel = UILabel(text: "", size: 24, textColor: .white)

    private lazy var personEmailLabel = UILabel(text: "", size: 24, textColor: .white)

    private lazy var extButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitle("Logout", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupHierarchy()
        setupLayout()
        transferDataUser()
    }

    //MARK: - Setup

    private func setupNavigationItem() {
        tabBarItem.image = UIImage(systemName: "person.fill")
        navigationController?.navigationBar.isHidden = true
    }

    @objc private func didTapLogout() {
        AuthService.shared.singOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserError(on: self, with: error)
                return
            }
            if let sceneDelegate = self.view.window?.windowScene?.delegate as?
                SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }

    private func transferDataUser() {
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserError(on: self, with: error)
                return
            }

            if let user = user {
                self.personNameLabel.text = user.userName
                self.personEmailLabel.text = user.email
            }
        }
    }

    private func setupHierarchy() {
        view.backgroundColor = UIColor(named: "background1")
        view.addSubview(personNameLabel)
        view.addSubview(personEmailLabel)
        view.addSubview(extButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            extButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            extButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            extButton.widthAnchor.constraint(equalToConstant: 70),

            personNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            personEmailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            personEmailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
