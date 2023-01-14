//
//  ForgotViewController.swift
//  Vii-Music
//
//  Created by Sergio on 12.01.23.
//

import UIKit

final class ForgotViewController: UIViewController {

    //MARK: - UIElements

    private lazy var logoImage: UIImageView = {
        let image = UIImage(named: "logoBackground")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let headerView = AuthHeaderView(title: "Forgot Password", subTitle: "Reset your password")

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.addTextFieldSetup()
        textField.setLeftPaddingPoints(10)
        textField.placeholder = "Email Address"
        return textField
    }()

    private lazy var singInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "lightBlue")
        button.setTitle("Sing in", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = .purple
        headerView.translatesAutoresizingMaskIntoConstraints = false
        setupHierarchy()
        setupLayout()
    }

    //MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(logoImage)
        view.addSubview(headerView)
        view.addSubview(emailTextField)
        view.addSubview(singInButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 280),

            emailTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            emailTextField.heightAnchor.constraint(equalToConstant: 42),

            singInButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 28),
            singInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            singInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            singInButton.heightAnchor.constraint(equalToConstant: 38),
        ])
    }

    @objc private func didTapForgotPassword() {
        let email = self.emailTextField.text ?? ""

        if !Validator.isValidEmail(for: email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }

        AuthService.shared.forgotPassword(with: email) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showErrorSendingPasswordReset(on: self, with: error)
                return
            }

            AlertManager.showPasswordResetSent(on: self)
        }
    }
}
