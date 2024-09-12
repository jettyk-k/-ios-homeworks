//
//  CellPhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Kirill Grunin on 24.05.2022.
//

import UIKit

class CellPhotoCollectionViewCell: UICollectionViewCell {
    private let photoImages: UIImageView = {
        let photoImages = UIImageView()
        photoImages .translatesAutoresizingMaskIntoConstraints = false
        photoImages .contentMode = .scaleAspectFill
        photoImages .clipsToBounds = true
        photoImages.layer.cornerRadius = 6
        return photoImages
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageModel(_ image: ImageModel) {
        photoImages.image = UIImage(named: image.image)
    }
    
    private func imageLayout() {
        contentView.addSubview(photoImages)
        
        NSLayoutConstraint.activate([
            photoImages.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImages.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImages.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImages.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
