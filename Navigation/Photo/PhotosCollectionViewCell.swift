//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Kirill Grunin on 24.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let galleryImages: UIImageView = {
        let galleryImage = UIImageView()
        galleryImage.translatesAutoresizingMaskIntoConstraints = false
        galleryImage.contentMode = .scaleAspectFill
        galleryImage.clipsToBounds = true
        return galleryImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageModel(_ image: PhotoGalery) {
        galleryImages.image = UIImage(named: image.image)
    }
    private func imageLayout() {
        contentView.addSubview(galleryImages)
        
        NSLayoutConstraint.activate([
            galleryImages.topAnchor.constraint(equalTo: contentView.topAnchor),
            galleryImages.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            galleryImages.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            galleryImages.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
