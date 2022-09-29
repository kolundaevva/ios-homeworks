//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владислав Колундаев on 29.09.2022.
//

import UIKit

class UserViewController: UIViewController {

    let userHeaderView = UserHeaderView()

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(userHeaderView)

        userHeaderView.frame = view.frame
        userHeaderView.configure(name: "Hipster Cat", status: "Waiting for something...")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .lightGray
    }
}
