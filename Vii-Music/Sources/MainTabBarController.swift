//
//  MainTabBarController.swift
//  Vii-Music
//
//  Created by Sergio on 8.01.23.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        setupTabBarViewControllers()
    }

    func setupTabBarController() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
    }

    func setupTabBarViewControllers() {
        
        let loginViewController = UINavigationController(rootViewController: LoginViewController())
        loginViewController.tabBarItem.image = UIImage(systemName: "apple.logo")

        let mainViewController = UINavigationController(rootViewController: MainViewController())
        mainViewController.tabBarItem.image = UIImage(systemName: "house")

        let playViewController = UINavigationController(rootViewController: PlayViewController())
        playViewController.tabBarItem.image = UIImage(systemName: "play")

        let personViewController = UINavigationController(rootViewController: FavoriteViewController())
        personViewController.tabBarItem.image = UIImage(systemName: "person.fill")

        let controllers = [loginViewController, mainViewController, playViewController, personViewController]
        setViewControllers(controllers, animated: true)
    }


}
