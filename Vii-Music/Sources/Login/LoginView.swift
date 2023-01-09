//
//  LoginView.swift
//  Vii-Music
//
//  Created by Sergio on 8.01.23.
//

import UIKit

final class LoginView: UIView {

    //MARK: - UIElements

    lazy var singInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "lightBlue")
        button.setTitle("Sing in", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImage(named: "logoBackground")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var logoNote: UIImageView = {
        let image = UIImage(named: "note")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var welcomeLabel = UILabel(text: "Welcome to Vii Music", size: 24, textColor: .systemTeal)

    private lazy var createLabel = UILabel(text: "Create your account",size: 30, textColor: .white)

    private lazy var nameLabel = UILabel(text: "Name", size: 14, textColor: .white)

    private lazy var emailLabel = UILabel(text: "Email", size: 14, textColor: .white)

    private lazy var passwordLabel = UILabel(text: "Password", size: 14, textColor: .white)

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.addTextFieldSetup()
        textField.setLeftPaddingPoints(10)
        return textField
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.addTextFieldSetup()
        textField.setLeftPaddingPoints(10)
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.addTextFieldSetup()
        textField.setLeftPaddingPoints(10)
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var orContinueWithLabel = UILabel(text: "Or continue with", size: 14, textColor: .systemGray)

    private let separatorLeft: UIView = {
        let bandLeft = UIView()
        bandLeft.backgroundColor = .lightGray
        bandLeft.layer.cornerRadius = 1
        bandLeft.translatesAutoresizingMaskIntoConstraints = false
        return bandLeft
    }()

    private let separatorRight: UIView = {
        let bandLeft = UIView()
        bandLeft.backgroundColor = .lightGray
        bandLeft.layer.cornerRadius = 1
        bandLeft.translatesAutoresizingMaskIntoConstraints = false
        return bandLeft
    } ()

    private let singUpButton: UIButton = {
        let button =   UIButton()
        button.backgroundColor = .white
        button.setTitle("Sing up with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let imageGoogle: UIImageView = {
        let image = UIImage(named: "google")
        let imageView = UIImageView(image: image)
        //imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    //MARK: - LifeCycle
    
    init() {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup

    func setupHierarchy() {
        addSubview(logoImage)
        addSubview(logoNote)
        addSubview(welcomeLabel)
        addSubview(createLabel)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(singInButton)
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(passwordLabel)
        addSubview(orContinueWithLabel)
        addSubview(separatorLeft)
        addSubview(separatorRight)
        addSubview(singUpButton)
        addSubview(imageGoogle)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: topAnchor),
            logoImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: trailingAnchor),

            logoNote.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            logoNote.centerXAnchor.constraint(equalTo: centerXAnchor),

            welcomeLabel.topAnchor.constraint(equalTo: logoNote.bottomAnchor, constant: 20),
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            createLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            createLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            nameTextField.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 50),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42),
            nameTextField.heightAnchor.constraint(equalToConstant: 42),

            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42),
            emailTextField.heightAnchor.constraint(equalToConstant: 42),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42),
            passwordTextField.heightAnchor.constraint(equalToConstant: 42),

            singInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 28),
            singInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            singInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42),
            singInButton.heightAnchor.constraint(equalToConstant: 38),

            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            nameLabel.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -8),

            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -8),

            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -8),

            orContinueWithLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            orContinueWithLabel.topAnchor.constraint(equalTo: singInButton.bottomAnchor, constant: 20),

            separatorLeft.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            separatorLeft.topAnchor.constraint(equalTo: singInButton.bottomAnchor, constant: 28),
            separatorLeft.heightAnchor.constraint(equalToConstant: 1),
            separatorLeft.widthAnchor.constraint(equalToConstant: 90),

            separatorRight.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42),
            separatorRight.topAnchor.constraint(equalTo: singInButton.bottomAnchor, constant: 28),
            separatorRight.heightAnchor.constraint(equalToConstant: 1),
            separatorRight.widthAnchor.constraint(equalToConstant: 90),

            singUpButton.topAnchor.constraint(equalTo: orContinueWithLabel.bottomAnchor, constant: 20),
            singUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            singUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42),
            singUpButton.heightAnchor.constraint(equalToConstant: 55),

            imageGoogle.centerXAnchor.constraint(equalTo: singUpButton.centerXAnchor, constant: -105),
            imageGoogle.centerYAnchor.constraint(equalTo: singUpButton.centerYAnchor),
            imageGoogle.heightAnchor.constraint(equalToConstant: 26),
            imageGoogle.widthAnchor.constraint(equalToConstant: 26),

        ])
    }
}
