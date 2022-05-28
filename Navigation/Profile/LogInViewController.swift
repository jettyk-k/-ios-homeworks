//
//  LogInViewController.swift
//  Navigation
//
//  Created by Kirill Grunin on 23.05.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let ColorSet: String = "#4885CC"
    
    private let nc = NotificationCenter.default
    
    private lazy var loginAndPassword = Login()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private let vkLogoImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.backgroundColor = .systemGray6
        stackView.distribution = .fillEqually
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    private let loginField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .systemGray6
        field.textColor = .black
        field.font = .systemFont(ofSize: 16)
        field.autocapitalizationType = .none
        field.placeholder = "Email or phone"
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 0.5
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.height))
        field.leftViewMode = .always
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .systemGray6
        field.textColor = .black
        field.font = .systemFont(ofSize: 16)
        field.autocapitalizationType = .none
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 0.5
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.height))
        field.leftViewMode = .always
        return field
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = hexStringToUIColor(hex: ColorSet)
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    private let warningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Длина пароля менее 6 символов"
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 10)
        label.isHidden = true
        return label
    }()
    
    private func showUpAlert() {
        let alert = UIAlertController(title: "Неверный логин или пароль", message: nil, preferredStyle: .alert)
        let actionPrint = UIAlertAction(title: "Oк", style: .default) { (_) -> Void in }
        alert.addAction(actionPrint)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
        loginField.delegate = self
        passwordField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    // Функция трансформации hex -> UIColor
    private func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    private func layout() {
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 2.0),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            
        ])
        
        [loginField, passwordField].forEach { stackView.addArrangedSubview($0) }
        [vkLogoImage, stackView, loginButton, warningLabel].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            vkLogoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkLogoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vkLogoImage.widthAnchor.constraint(equalToConstant: 100),
            vkLogoImage.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: vkLogoImage.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor),
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            loginField.topAnchor.constraint(equalTo: stackView.topAnchor),
            loginField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            loginField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor),
            passwordField.widthAnchor.constraint(equalTo: loginField.widthAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            warningLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            warningLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    @objc func buttonClicked() {
        let vc = ProfileViewController()
        
        guard let login = loginField.text else { return }
        guard let password = passwordField.text else { return }
        
        if login.isEmpty && password.isEmpty {
            loginField.shakeField()
            passwordField.shakeField()
        } else if login.isEmpty {
            loginField.shakeField()
        } else if password.isEmpty {
            passwordField.shakeField()
        } else {
            if password.count < 6 {
                warningLabel.isHidden = false
            } else {
                warningLabel.isHidden = true
                if (loginField.text != loginAndPassword.userName) && (passwordField.text != loginAndPassword.userPassword) {
                    showUpAlert()
                } else if loginField.text != loginAndPassword.userName {
                    showUpAlert()
                } else if passwordField.text != loginAndPassword.userPassword {
                    showUpAlert()
                } else {
                    navigationController?.pushViewController(vc, animated: true)
                    warningLabel.isHidden = true
                }
            }
        }
    }
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

