//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Kirill Grunin on 21.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(headerView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = view.frame
    }
}
