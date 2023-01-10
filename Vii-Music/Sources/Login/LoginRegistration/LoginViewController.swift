//
//  ViewController.swift
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
        loginView?.singInButton.addTarget(self, action: #selector(registerAccount), for: .touchUpInside)
        loginView?.singUpButton.addTarget(self, action: #selector(signUpGoogle), for: .touchUpInside)
    }

    //MARK: - Setup

    @objc func registerAccount() {
        let loginInputViewController = LoginInputController()
        if let navigator = navigationController {
            navigator.pushViewController(loginInputViewController, animated: true)
        }
    }

    @objc func signUpGoogle() {
        print("hello googl")
    }
}
