//
//  TabBarController.swift
//  Navigation
//
//  Created by Kirill Grunin on 21.05.2022.
//

import UIKit

class TabBarController: UITabBarController {

    let feedVC = FeedViewController()
    let profileVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6
        setupControllers()
    }
    
    private func setupControllers() {
        let feedNavController = UINavigationController(rootViewController: feedVC)
        feedVC.tabBarItem.title = "Feed"
        feedVC.tabBarItem.image = UIImage(systemName: "house.fill")
        feedVC.navigationItem.title = "Feed"
        
        let profileNavController = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem.title = "Profile"
        profileVC.tabBarItem.image = UIImage(systemName: "person.fill")
        profileVC.navigationItem.title = "Profile"
        
        viewControllers = [feedNavController, profileNavController]
    }
}
