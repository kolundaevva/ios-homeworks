//
//  PostViewController.swift
//  Navigation
//
//  Created by Владислав Колундаев on 29.09.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showInfo))
    }

    @objc private func showInfo() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}
