//
//  LoginRegistrationViewController.swift
//  Vii-Music
//
//  Created by Артем Орлов on 08.01.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Properties

    private var loginView: LoginView? {
        guard isViewLoaded else { return nil }
        return view as? LoginView
    }

    //MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        creatingActionButton()
        navigationController?.navigationBar.isHidden = true
    }

    //MARK: - Setup

    @objc func registerAccount() {

        let registerUserRequest = RegisterUserRequest(
            userName: loginView?.nameTextField.text ?? "",
            email: loginView?.emailTextField.text ?? "",
            password: loginView?.passwordTextField.text ?? "")

        //Username check
        if !Validator.isValidUsername(for: registerUserRequest.userName) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }

        //Username check
        if !Validator.isValidEmail(for: registerUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }

        //Username check
        if !Validator.isPasswordValid(for: registerUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }

        AuthService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
            guard let self = self else { return }

            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }

            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            } else {
                AlertManager.showRegistrationErrorAlert(on: self)
            }
        }
    }

    private func creatingActionButton() {
        loginView?.singInButton.addTarget(self, action: #selector(registerAccount), for: .touchUpInside)
        loginView?.singUpButton.addTarget(self, action: #selector(signUpGoogle), for: .touchUpInside)
        loginView?.loginInputScreenButton.addTarget(self, action: #selector(didTapRegistrationScreenButton), for: .touchUpInside)
    }

    @objc func didTapRegistrationScreenButton() {
        let loginInputController = LoginInputController()
        if let navigator = navigationController {
            navigator.pushViewController(loginInputController, animated: true)
        }
    }

    @objc func signUpGoogle() {
        print("hello google")
    }
}
