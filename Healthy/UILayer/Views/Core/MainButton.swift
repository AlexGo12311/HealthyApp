//
//  MainButton.swift
//  Healthy
//
//  Created by Alex Neumark on 27.07.2024.
//

import UIKit

enum MainButtonStyle {
    case fill
    case plain
    case greyFill
}

class MainButton: UIView {
    var buttonStyle: MainButtonStyle
    private let button = UIButton()
    private var buttonTitle: String
    var action: (() -> Void)?
    
    init(appearence: MainButtonStyle, title: String) {
        self.buttonStyle = appearence
        self.buttonTitle = title
        super.init(frame: .zero)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("MainButton Error!")
    }
    
    private func setupLayout() {
        setupButton()
    }
    
    func setupButton() {
        addSubview(button)
        button.setTitle(buttonTitle, for: .normal)
        setAppearence(style: buttonStyle)
        button.titleLabel?.font = .Montserrat.Regular.size(of: 16)
        button.layer.cornerRadius = 16
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    public func setAppearence(style: MainButtonStyle) {
        switch style {
            
        case .fill:
            button.backgroundColor = AccentColors.mainBlue
            button.setTitleColor(.white, for: .normal)
        case .plain:
            button.backgroundColor = .clear
            button.setTitleColor(AccentColors.mainBlue, for: .normal)
            button.layer.borderWidth = 3
            button.layer.borderColor = AccentColors.mainBlue?.cgColor
        case .greyFill:
            button.backgroundColor = AccentColors.unselectedIcon
            button.setTitleColor(.white, for: .normal)
            
        }
    }
    
    public func setTitle(_ title: String) {
        self.button.setTitle(title, for: .normal)
    }
    
    @objc private func buttonPressed() {
        guard let action = self.action else { return }
        action()
    }
    

}

//#Preview("MainButton", traits: .fixedLayout(width: 312, height: 48)) {
//    let button = MainButton(appearence: .plain, title: "Hi")
//    button.setTitle("Next")
//    return button
//}
