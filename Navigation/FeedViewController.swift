//
//  FeedViewController.swift
//  Navigation
//
//  Created by Kirill Grunin on 21.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postButton)
    }
    
    private lazy var postButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Посмотреть пост", for: .normal)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        return button
    }()
    
    @objc func showPost() {
        let postVC = PostViewController()
        postVC.post = post
        self.navigationController?.pushViewController(postVC, animated: true)
    }
}
