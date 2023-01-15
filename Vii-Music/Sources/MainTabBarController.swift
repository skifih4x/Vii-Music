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
        tabBar.backgroundColor = UIColor(named: "tabBarColor")
        tabBar.tintColor = Theme.brightGreen
        tabBar.unselectedItemTintColor = .white
    }

    func setupTabBarViewControllers() {

        let mainViewController = MainViewController()
        mainViewController.tabBarItem.image = UIImage(systemName: "house")

        let playViewController = PlayViewController()
        playViewController.tabBarItem.image = UIImage(systemName: "play")

        let personViewController = PersonViewController()
        personViewController.tabBarItem.image = UIImage(systemName: "person")

        let controllers = [mainViewController, playViewController, personViewController]
        setViewControllers(controllers, animated: true)
    }
}
