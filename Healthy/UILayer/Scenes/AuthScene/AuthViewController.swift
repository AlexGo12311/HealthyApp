//
//  AuthViewController.swift
//  Healthy
//
//  Created by Alex Neumark on 26.07.2024.
//

import UIKit
enum LoginViewState {
    case initial
    case login
    case signUp
}

protocol AuthInput: AnyObject {
    func OnSignUpTaped()
    func OnLoginTapped()
    func OnForgotTapped()
}

class AuthViewController: UIViewController {

    
    // MARK: - Properties
    private var state: LoginViewState = .initial
    // MARK: - Views
    private var textField = MainTextField()
    private var bottomView = AuthBottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        setupTextField()
        setupBottomView()
    }

}

private extension AuthViewController {
    func setupTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 46),
            textField.widthAnchor.constraint(equalToConstant: 327)
        ])
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

#Preview("AuthVC") {
    AuthViewController()
}
