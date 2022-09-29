//
//  InfoViewController.swift
//  Navigation
//
//  Created by Владислав Колундаев on 29.09.2022.
//

import UIKit

class InfoViewController: UIViewController {

    let alertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("Show", for: .normal)
        return button
    }()

    override func viewWillLayoutSubviews() {
        overlayFirstLayer()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }

    private func overlayFirstLayer() {
        view.addSubview(alertButton)

        alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        alertButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        alertButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    @objc private func showAlert() {
        let alertController = UIAlertController(title: "Удалить пост?", message: "Пост нельзя будет восстановить", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            print("Отмена")
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            print("Удалить")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
