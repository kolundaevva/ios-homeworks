//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Владислав Колундаев on 01.10.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()

    let postImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        return view
    }()

    let text: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
    }()

    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    static let reuseIdentifier = "Post"
    private let cellLayoutCalculator: CellLayoutCalculatorProtocol = CellLayoutCalculator()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        overlayFirstLayer()
        overlaySecondLayer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with post: PostViewModel.Cell) {
        text.frame = post.sizes.postLabelFrame
        postImageView.frame = post.sizes.attachmentFrame
        bottomView.frame = post.sizes.bottomViewFrame

        title.text = post.author
        text.text = post.description
        postImageView.image = UIImage(named: post.image)
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Likes: \(post.views)"
    }

    private func overlayFirstLayer() {
        addSubview(title)

        title.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        title.heightAnchor.constraint(equalToConstant: Constants.topHeight).isActive = true

        addSubview(postImageView)
        addSubview(text)
        addSubview(bottomView)

        bottomView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: Constants.topHeight).isActive = true
    }

    private func overlaySecondLayer() {
        bottomView.addSubview(likesLabel)

        likesLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 8).isActive = true
        likesLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -8).isActive = true

        bottomView.addSubview(viewsLabel)

        viewsLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -8).isActive = true
        viewsLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -8).isActive = true
    }
}
