//
//  PostViewController.swift
//  Navigation
//
//  Created by Владислав Колундаев on 29.09.2022.
//

import UIKit

class PostViewController: UIViewController {

    var post: Post? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        title = post?.title
        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showInfo))
    }

    @objc private func showInfo() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}
