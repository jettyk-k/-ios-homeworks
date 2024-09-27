//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Kirill Grunin on 24.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    //  MARK: - Создание и настройка объектов для кастомизации ячейки
    
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
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapOnImage)
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
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .white
        label.text = "Likes: "
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapOnLabel)
        return label
    }()
    
    private lazy var numberOfLikes: UILabel = {
        lazy var numberOfLikes = UILabel()
        numberOfLikes.translatesAutoresizingMaskIntoConstraints = false
        numberOfLikes.font = .systemFont(ofSize: 16, weight: .regular)
        numberOfLikes.textColor = .black
        numberOfLikes.text = "0"
        return numberOfLikes
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = .white
        label.text = "Views: "
        return label
    }()
    
    private lazy var numberOfViews: UILabel = {
        lazy var numberOfViews = UILabel()
        numberOfViews.translatesAutoresizingMaskIntoConstraints = false
        numberOfViews.font = .systemFont(ofSize: 16, weight: .regular)
        numberOfViews.textColor = .black
        numberOfViews.text = "0"
        return numberOfViews
    }()
    //  MARK: - Инициализатор
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Обработка нажатий

    lazy var tapOnLabel = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))

    @objc func tapLabel() {
        numberOfLikes.text = reciverOfDataFromeCell?.addLikes(likesInLabel: numberOfLikes.text ?? "0")
    }

    lazy var tapOnImage = UITapGestureRecognizer(target: self, action: #selector(tapImage))
    
    @objc func tapImage() {
        numberOfViews.text = reciverOfDataFromeCell?.showPhoto(viewsInLabel: numberOfViews.text ?? "0", postPhoto: postImageView.image!)
       
    }
    
    //  MARK: - Заполнение ячеек данными

    func setupCell(model: PostModel) {
        postNameLabel.text = model.author
        postImageView.image = model.image
        descriptionLabel.text = model.description
        numberOfLikes.text = "\(model.likes)"
        numberOfViews.text = "\(model.views)"
    }
    
    //  MARK: - Расстановка объектов в ячейке
    
    private func layout() {
        contentView.addSubview(whiteView)
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        [postNameLabel,postImageView, descriptionLabel, likesLabel, numberOfLikes, viewsLabel, numberOfViews].forEach{ whiteView.addSubview($0) }
        
        let standartInset: CGFloat = 16
        let imageIndend: CGFloat = 12
        
        NSLayoutConstraint.activate([
            postNameLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: standartInset),
            postNameLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartInset),
            postNameLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -standartInset),
            postNameLabel.bottomAnchor.constraint(equalTo: postImageView.topAnchor, constant: -imageIndend),
            
            postImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor),
            postImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -standartInset),
            postImageView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 1.0),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartInset),
            descriptionLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -standartInset),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: standartInset),
            likesLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: standartInset),
            likesLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -standartInset),
            
            numberOfLikes.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            numberOfLikes.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor),
            numberOfLikes.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -standartInset),
            
            numberOfViews.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: standartInset),
            numberOfViews.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -standartInset),
            numberOfViews.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -standartInset),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: standartInset),
            viewsLabel.trailingAnchor.constraint(equalTo: numberOfViews.leadingAnchor),
            viewsLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -standartInset)
        ])
    }
    
    //  MARK: - Делегат
    
    var reciverOfDataFromeCell: DelegateOfReciverOfDataFromeCell?
}



