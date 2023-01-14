//
//  LoginInputController.swift
//  Vii-Music
//
//  Created by Sergio on 10.01.23.
//

import UIKit

final class LoginInputController: UIViewController {

    // MARK: - Properties

    private var loginView: LoginInputView? {
        guard isViewLoaded else { return nil }
        return view as? LoginInputView
    }

    //MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = LoginInputView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        creatingActionButton()
    }

    //MARK: - Setup

    private func creatingActionButton() {
        loginView?.singInButton.addTarget(self, action: #selector(didTapSingIn), for: .touchUpInside)
        loginView?.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        loginView?.rememberMeButton.addTarget(self, action: #selector(didTapRememberMe), for: .touchUpInside)
    }

    @objc func didTapSingIn() {
        let loginRequest = LoginUserRequest(
            email: loginView?.emailTextField.text ?? "",
            password: loginView?.passwordTextField.text ?? "")

        //Username check
        if !Validator.isValidEmail(for: loginRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }

        //Username check
        if !Validator.isPasswordValid(for: loginRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }

        AuthService.shared.singIn(with: loginRequest) { error in
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }

            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }

    @objc func didTapForgotPassword() {
        let forgotViewController = ForgotViewController()
        if let navigator = navigationController {
            navigator.pushViewController(forgotViewController, animated: true)
        }
    }

    @objc func didTapRememberMe() {

        if loginView?.rememberMeButton.backgroundColor == .white {
            loginView?.rememberMeButton.backgroundColor = UIColor(named: "lightBlue")
        } else if loginView?.rememberMeButton.backgroundColor == UIColor(named: "lightBlue") {
            loginView?.rememberMeButton.backgroundColor = .white
        }
    }
}
