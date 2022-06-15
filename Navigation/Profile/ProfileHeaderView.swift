//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Kirill Grunin on 22.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    let profileStatus = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpProfile()
    }
    
    func setUpProfile() {
        
        let profilePhoto = UIImageView(frame: CGRect(x: self.safeAreaInsets.left + 16, y: self.safeAreaInsets.top + 16, width: 100, height: 100))
        profilePhoto.image = UIImage(named: "theWaitingThing")
        profilePhoto.layer.cornerRadius = 50
        profilePhoto.layer.borderWidth = 3
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        profilePhoto.contentMode = .scaleAspectFill
        profilePhoto.clipsToBounds = true
        addSubview(profilePhoto)
        
        let headLabel = UILabel(frame: CGRect(x: profilePhoto.frame.maxX + 30 , y: profilePhoto.frame.origin.y + 9, width: window!.frame.width - 32, height: 35))
        headLabel.font = .systemFont(ofSize: 18, weight: .bold)
        headLabel.textColor = .black
        headLabel.text = "Ждунчик"
        addSubview(headLabel)
        
        profileStatus.frame = CGRect(x: profilePhoto.frame.maxX + 30, y: profilePhoto.frame.maxY - 34, width: headLabel.frame.width, height: 33)
        profileStatus.font = .systemFont(ofSize: 14, weight: .regular)
        profileStatus.textColor = .gray
        profileStatus.text = "Waiting for something..."
        addSubview(profileStatus)
        
        let showStatusButton = UIButton(frame: CGRect(x: self.safeAreaInsets.left + 16, y: profilePhoto.frame.maxY + 16, width: window!.frame.width - 32, height: 50))
        showStatusButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.titleLabel?.textColor = .white
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.addTarget(self, action: #selector(pushShowStatusButton), for: .touchUpInside)
        addSubview(showStatusButton)
    }
        
    @objc func pushShowStatusButton(sender: UIButton!) {
        print("Status is: \(profileStatus.text)")
    }
}
