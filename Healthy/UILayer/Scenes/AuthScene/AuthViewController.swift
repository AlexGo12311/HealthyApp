//
//  AuthViewController.swift
//  Healthy
//
//  Created by Alex Neumark on 26.07.2024.
//

import UIKit

class AuthViewController: UIViewController {

    private var textField = MainTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        setupTextField()
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
}
