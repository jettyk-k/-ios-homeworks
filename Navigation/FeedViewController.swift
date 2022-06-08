//
//  FeedViewController.swift
//  Navigation
//
//  Created by Kirill Grunin on 21.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var postButton: UIButton!
    
    var post = Post()
    
    override func loadView() {
        view = UIView()
        
        postButton = UIButton()
        postButton.backgroundColor = .blue
        postButton.layer.cornerRadius = 5
        postButton.frame = CGRect(x: 20, y: 200, width: 200, height: 40)
        postButton.setTitle("Post", for: .normal)
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        view.addSubview(postButton)
    }
    
    @objc func showPost() {
        let postVC = PostViewController()
        postVC.post = post
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
