//
//  AuthBottomView.swift
//  Healthy
//
//  Created by Alex Neumark on 29.07.2024.
//

import UIKit

class AuthBottomView: UIView {
    
    private let label = UILabel()
    private let button = UIButton()
    var action: (() -> Void)?
    
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        setupLabel()
        setupButton()
        self.backgroundColor = .clear
    }
    
}

extension AuthBottomView {
    private func setupLabel() {
        self.addSubview(label)
        label.font = UIFont.Montserrat.Light.size(of: 14)
        label.textColor = AccentColors.convenienceTextColor
        label.text = "Don’t have an account?"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),

        ])
    }
    
    private func setupButton() {
        self.addSubview(button)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(AccentColors.mainBlue, for: .normal)
        button.titleLabel?.font = .Montserrat.Light.size(of: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 170),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        guard let action = self.action else { return }
        action()
}


}

//#Preview("AuthButtomView", traits: .fixedLayout(width: 300, height: 50)) {
//    AuthBottomView()
//}
