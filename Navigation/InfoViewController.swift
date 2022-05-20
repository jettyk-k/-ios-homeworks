//
//  InfoViewController.swift
//  Navigation
//
//  Created by Kirill Grunin on 21.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show alert", for: .normal)
        button.layer.cornerRadius = 5
        button.frame = CGRect(x: 20, y: 200, width: 200, height: 40)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(alertButton)
    }

    @objc private func showAlert() {
        let ac = UIAlertController(title: "Alert", message: "Test alert", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Print", style: .default, handler: { _ in print("Test print")
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(ac, animated: true)
    }
}
