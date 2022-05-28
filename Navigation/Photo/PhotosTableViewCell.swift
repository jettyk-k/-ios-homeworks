//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Kirill Grunin on 24.05.2022.
//

import UIKit

protocol PhotosTableViewCellDelegate: AnyObject {
    func buttonPushed()
}

class PhotosTableViewCell: UITableViewCell {
    
    let photoGalery: [PhotoGalery] = PhotoGalery.makeImageModel()
    
    weak var delegate: PhotosTableViewCellDelegate?
      
    private lazy var collectionView: UICollectionView = {
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.scrollDirection = .horizontal
        let viewCollection = UICollectionView(frame: .zero ,collectionViewLayout: layoutCollection)
        viewCollection.translatesAutoresizingMaskIntoConstraints = false
        viewCollection.dataSource = self
        viewCollection.delegate = self
        viewCollection.register(CellPhotoCollectionViewCell.self, forCellWithReuseIdentifier: CellPhotoCollectionViewCell.identifier)
        return viewCollection
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.addTarget(self, action: #selector(goingToGallery), for: .touchUpInside)
        return button
    }()
    
    private let labelText: UILabel = {
        let labelText = UILabel()
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.textColor = .black
        labelText.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return labelText
    }()
    
    @objc private func goingToGallery() {
        delegate?.buttonPushed()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel(_ label: String) {
        labelText.text = "Photo"
    }
    
    private func setupLayout() {
        [collectionView, labelText, button] .forEach { contentView.addSubview($0) }
        
        let inset: CGFloat = 12
        let insetForPhoto: CGFloat = 8
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: inset),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset - insetForPhoto),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset + insetForPhoto),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            
            labelText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            labelText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            
            button.centerYAnchor.constraint(equalTo: labelText.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension PhotosTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGalery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellPhotoCollectionViewCell.identifier, for: indexPath) as!
        CellPhotoCollectionViewCell
        cell.setupImageModel(photoGalery[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    var insetForPhoto: CGFloat {return 8}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.bounds.width - insetForPhoto * 3) / 4
        return CGSize(width: height, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return insetForPhoto
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: insetForPhoto, left: insetForPhoto, bottom: insetForPhoto, right: insetForPhoto)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return insetForPhoto
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.item)
    }
}

