//
//  ViewController.swift
//  Navigation
//
//  Created by Владислав Колундаев on 28.09.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    let button: UIButton = {
        let bttn = UIButton()

        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        bttn.setTitleColor(UIColor.blue, for: .normal)
        
        bttn.layer.borderWidth = 2
        bttn.layer.cornerRadius = 10
        bttn.clipsToBounds = true

        bttn.setTitle("Go", for: .normal)

        return bttn
    }()

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        overlayFirstLayer()
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(showMore), for: .touchUpInside)
    }

    private func overlayFirstLayer() {
        view.addSubview(button)

        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    @objc private func showMore() {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
}

