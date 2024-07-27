//
//  ReuseTextField.swift
//  Healthy
//
//  Created by Alex Neumark on 27.07.2024.
//

import UIKit

class MainTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("MainTextField error")
    }
    
    private func setupLayout() {
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.backgroundColor = .white
        self.placeholder = "Placeholder"
        self.layer.borderColor = AccentColors.convenienceTextColor?.cgColor
        self.font = UIFont.Montserrat.Regular.size(of: 16)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
