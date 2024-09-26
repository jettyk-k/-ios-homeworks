//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Kirill Grunin on 21.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let headerView: UIView = {
        let view = ProfileHeaderView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let newButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Новая кнопка", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurateHeaderView()
    }
    
    private func configurateHeaderView(){
        
        [headerView, newButton].forEach{view.addSubview($0)}

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 220)
            ])
        
        NSLayoutConstraint.activate([
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}
