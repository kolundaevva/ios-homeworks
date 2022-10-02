//
//  LogInViewController.swift
//  Navigation
//
//  Created by Владислав Колундаев on 30.09.2022.
//

import UIKit

class LogInViewController: UIViewController {

    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let loginTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Login"
        tf.textColor = .black
        tf.backgroundColor = .systemGray6
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 10
        tf.clipsToBounds = true
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.autocapitalizationType = .none
        return tf
    }()

    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password"
        tf.textColor = .black
        tf.backgroundColor = .systemGray6
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 10
        tf.clipsToBounds = true
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        return tf
    }()

    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.tintColor = .white
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel")?.withAlpha(0.8), for: .selected)
        button.setBackgroundImage(UIImage(named: "blue_pixel")?.withAlpha(0.8), for: .highlighted)
        button.setBackgroundImage(UIImage(named: "blue_pixel")?.withAlpha(0.8), for: .disabled)
        button.addTarget(self, action: #selector(showViewController), for: .touchUpInside)
        return button
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraint()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white

        setupNotification()
        setupKeyboardDismissRecognizer()
    }

    private func setupConstraint() {
        view.addSubview(scrollView)

        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        //        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollView.addSubview(logoImageView)

        logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        scrollView.addSubview(loginTextField)

        loginTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120).isActive = true
        loginTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        loginTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32).isActive = true
        //        loginTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        //        loginTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        scrollView.addSubview(passwordTextField)

        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32).isActive = true
        //        passwordTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        //        passwordTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        scrollView.addSubview(loginButton)

        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32).isActive = true
        //        loginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        //        loginButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setupNotification() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    private func setupKeyboardDismissRecognizer() {
        let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(dismissKeyboard))
        scrollView.addGestureRecognizer(tapRecognizer)
    }

    @objc private func showViewController() {
        let userVC = UserViewController()
        navigationController?.pushViewController(userVC, animated: true)
    }

    @objc private func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEnd = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEnd, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height)
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        scrollView.verticalScrollIndicatorInsets = scrollView.contentInset
        scrollView.horizontalScrollIndicatorInsets = scrollView.contentInset
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
