//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Kirill Grunin on 22.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = "Waiting for something..."
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGestures() {
        let tapGestureImage = UITapGestureRecognizer(target: self, action: #selector(tapAvatar))
        avatarImageView.addGestureRecognizer(tapGestureImage)
        avatarImageView.isUserInteractionEnabled = true
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
        button.setTitle("Set status", for: .normal)
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
        textField.placeholder = "Set your status..."
        textField.layer.cornerRadius = 12
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()
    
    private var topAvatarImageView = NSLayoutConstraint()
    private var leadingAvatarImageView = NSLayoutConstraint()
    private var widthAvatarImageView = NSLayoutConstraint()
    private var heightAvatarImageView = NSLayoutConstraint()
    
    private let viewUnderAvatar: UIView = {
        let viewUnderAvatar = UIView()
        let profileVC = ProfileViewController()
        viewUnderAvatar.translatesAutoresizingMaskIntoConstraints = false
        viewUnderAvatar.backgroundColor = .black
        viewUnderAvatar.alpha = 0.0
        viewUnderAvatar.frame = profileVC.view.frame
        return viewUnderAvatar
    }()
    
    private lazy var closeProfileAvatarButton: UIButton = {
        let closeProfileAvatarButton = UIButton()
        closeProfileAvatarButton.translatesAutoresizingMaskIntoConstraints = false
        closeProfileAvatarButton.setImage(UIImage(systemName: "multiply"), for: UIControl.State.normal)
        closeProfileAvatarButton.contentMode = .scaleAspectFill
        closeProfileAvatarButton.alpha = 0.0
        closeProfileAvatarButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return closeProfileAvatarButton
    }()
    
    private func layout() {
        [fullNameLabel, statusLabel, statusTextField, setStatusButton, viewUnderAvatar, avatarImageView, closeProfileAvatarButton].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            closeProfileAvatarButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            closeProfileAvatarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        topAvatarImageView = avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        leadingAvatarImageView = avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        widthAvatarImageView = avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        heightAvatarImageView = avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([
            topAvatarImageView,
            leadingAvatarImageView,
            widthAvatarImageView,
            heightAvatarImageView
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -8),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }

    @objc func pushShowStatusButton(sender: UIButton!) {
        statusLabel.text = statusTextField.text
        self.statusTextField.resignFirstResponder()
    }
    
    @objc func statusTextChanged(sender: UITextField) {
        statusText = statusTextField.text ?? ""
    }
    
    @objc private func tapAvatar() {
        UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.topAvatarImageView.constant = (UIScreen.main.bounds.height - UIScreen.main.bounds.width) / 3
            self.leadingAvatarImageView.constant = 0
            self.widthAvatarImageView.constant = UIScreen.main.bounds.width
            self.heightAvatarImageView.constant = self.widthAvatarImageView.constant
            self.avatarImageView.layer.cornerRadius = 0
            self.viewUnderAvatar.alpha = 0.8
            self.layoutIfNeeded()
        } completion: { _ in
            UIImageView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn){
                self.closeProfileAvatarButton.alpha = 1
            }
        }
    }
    
    @objc private func closeAction(){
        UIImageView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn){
            self.closeProfileAvatarButton.alpha = 0.0
        } completion: { _ in
            UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) { [self] in
                topAvatarImageView.constant  = 16
                leadingAvatarImageView.constant = 16
                widthAvatarImageView.constant  = 100
                heightAvatarImageView.constant  = 100
                viewUnderAvatar.alpha = 0.0
                avatarImageView.layer.cornerRadius = 50
                layoutIfNeeded()
            }
        }
    }
}
