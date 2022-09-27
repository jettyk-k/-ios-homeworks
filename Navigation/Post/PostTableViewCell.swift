//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Kirill Grunin on 24.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let postNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()

    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ model: PostModel) {
        postNameLabel.text = model.author
        postImageView.image = model.image
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: " + String(model.likes)
        viewsLabel.text = "Views: " + String(model.views)
    }
  
    
    private func layout() {
        contentView.addSubview(whiteView)
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        [postNameLabel,postImageView, descriptionLabel, likesLabel, viewsLabel].forEach{ whiteView.addSubview($0) }
        
        let standartInset: CGFloat = 16
        let imageInset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            postNameLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: standartInset),
            postNameLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartInset),
            postNameLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -standartInset),
            postNameLabel.bottomAnchor.constraint(equalTo: postImageView.topAnchor, constant: -imageInset)
        ])
        
        NSLayoutConstraint.activate([
            postImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor),
            postImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -standartInset),
            postImageView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 1.0)

        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartInset),
            descriptionLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -standartInset)
        ])
        
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: standartInset),
            likesLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartInset),
            likesLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -standartInset),
        ])
        
        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: standartInset),
            viewsLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -standartInset),
            viewsLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -standartInset)
        ])
    }

}
