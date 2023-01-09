//
//  ViewController.swift
//  Vii-Music
//
//  Created by Артем Орлов on 08.01.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Properties

    let customView = LoginView()

    //MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        customView.singInButton.addTarget(self, action: #selector(registerAccount()), for: .touchUpInside)
    }

    //MARK: - Setup

//    @objc func registerAccount() {
//
//    }
}
