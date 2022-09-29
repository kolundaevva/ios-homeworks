//
//  UserHeaderView.swift
//  Navigation
//
//  Created by Владислав Колундаев on 29.09.2022.
//

import UIKit

class UserHeaderView: UIView {
    private let userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()

    private let userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()

    private let statusTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 12
        tf.clipsToBounds = true
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return tf
    }()

    private let statusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    private var statusText: String = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }

    private func setupLayout() {
        addSubview(userImage)

        userImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        userImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 80).isActive = true

        addSubview(userLabel)

        userLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        userLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        addSubview(statusButton)

        statusButton.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 16).isActive = true
        statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        statusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        addSubview(statusTextField)

        statusTextField.leadingAnchor.constraint(equalTo: userLabel.leadingAnchor).isActive = true
        statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -4).isActive = true

        addSubview(statusLabel)

        statusLabel.leadingAnchor.constraint(equalTo: userLabel.leadingAnchor).isActive = true
        statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -4).isActive = true

    }

    func configure(name: String, status: String) {
        userImage.image = UIImage(named: "person")
        userLabel.text = name
        statusLabel.text = status

        userImage.layer.cornerRadius = userImage.bounds.height / 2
        userImage.clipsToBounds = true
    }

    @objc private func buttonPressed() {
        statusLabel.text = statusText
        statusButton.setTitle("Show status", for: .normal)
        statusTextField.text = nil
        statusTextField.endEditing(true)
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusButton.setTitle("Set status", for: .normal)

        if !(textField.text?.isEmpty ?? true) {
            statusText = textField.text!
        }
    }
}
