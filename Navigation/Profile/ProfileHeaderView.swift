//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Kirill Grunin on 22.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = "Waiting for something..."
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    private let avatarImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "theWaitingThing")
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Ждун Ждуныч"
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = statusText
        return label
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowOffset.width = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(pushShowStatusButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Listening to music"
        textField.layer.cornerRadius = 12
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()
    
    private func layout() {
        [avatarImageView, fullNameLabel, statusLabel, setStatusButton, statusTextField].forEach{addSubview($0)}
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27)
        ])
        
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 36),
            setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.widthAnchor.constraint(equalTo: self.window!.widthAnchor, constant: -32),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -18)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -14),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
            statusTextField.widthAnchor.constraint(equalTo: self.window!.widthAnchor, constant: -159),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func pushShowStatusButton(sender: UIButton!) {
        statusLabel.text = statusTextField.text
        self.statusTextField.resignFirstResponder()
    }
    
    @objc func statusTextChanged(sender: UITextField) {
        statusText = statusTextField.text ?? ""
    }
}
