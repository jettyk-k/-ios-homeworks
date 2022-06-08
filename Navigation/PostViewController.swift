//
//  PostViewController.swift
//  Navigation
//
//  Created by Kirill Grunin on 21.05.2022.
//

import UIKit

class PostViewController: UIViewController {

    var post: Post!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemYellow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = post.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(showInfo))
    }
    
    @objc private func showInfo() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true)
    }
    
}
