//
//  SceneDelegate.swift
//  Vii-Music
//
//  Created by Артем Орлов on 08.01.2023.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var onboarding = false

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setupWindow(with: scene)
        checkAuthentication()
    }

    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
    }

    public func checkAuthentication() {
        if Auth.auth().currentUser == nil {
            onboarding = true
            gotoController(with: LoginViewController())
        } else if onboarding == true {
                gotoController(with: OnboardingViewController())
            } else {
                gotoController(with: MainTabBarViewController())
            }
    }

    private func gotoController(with viewController: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.25) {
                self?.window?.layer.opacity = 0

            } completion: { [weak self] _  in
                
                let navigationController = UINavigationController(rootViewController: viewController)
                self?.window?.rootViewController = navigationController
                
                UIView.animate(withDuration: 0.25) { [weak self] in
                    self?.window?.layer.opacity = 1
                }
            }
        }
    }
}
