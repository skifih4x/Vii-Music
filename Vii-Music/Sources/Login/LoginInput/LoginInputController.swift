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
        loginView?.singInButton.addTarget(self, action: #selector(entryMainScreen), for: .touchUpInside)
    }

    //MARK: - Setup

    @objc func entryMainScreen() {
        let mainViewController = MainViewController()
        if let navigator = navigationController {
            navigator.pushViewController(mainViewController, animated: true)
        }
    }
}
