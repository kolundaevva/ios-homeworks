//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Владислав Колундаев on 02.10.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    static let reuseIdentifier = "Photo"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        overlayFirstLayer()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        overlayFirstLayer()
    }

    func configure(with imageName: String) {
        photoImageView.image = UIImage(named: imageName)
    }

    private func overlayFirstLayer() {
        addSubview(photoImageView)

        photoImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
