//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Владислав Колундаев on 02.10.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    let photoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        return label
    }()

    let followButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let imagesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var height: CGFloat {
        return (UIScreen.main.bounds.width - 48) / 4
    }

    var imagesName = [String]()
    static let reuseIdentifier = "Photos"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        overlayFirstLayer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with imagesName: [String]) {
        self.imagesName = imagesName
        overlaySecondLayer()
    }

    private func overlayFirstLayer() {
        addSubview(photoLabel)

        photoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        photoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true

        addSubview(followButton)

        followButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        followButton.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor).isActive = true

        addSubview(imagesView)

        imagesView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12).isActive = true
        imagesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        imagesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        imagesView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        imagesView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    private func overlaySecondLayer() {
        for (i, name) in imagesName.enumerated() {
            let view = UIImageView(image: UIImage(named: name))
            view.layer.cornerRadius = 6
            view.clipsToBounds = true
            imagesView.addSubview(view)
            let padding: CGFloat = i == 0 ? 0 : 8
            view.frame = CGRect(x: CGFloat(i) * (height + padding), y: 0, width: height, height: height)
        }
    }
}
