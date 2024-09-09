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

class MainButton: UIButton {
    var buttonStyle: MainButtonStyle

    private var buttonTitle: String
    
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
        self.setTitle(buttonTitle, for: .normal)
        setAppearence(style: buttonStyle)
        self.titleLabel?.font = .Montserrat.Regular.size(of: 16)
        self.layer.cornerRadius = 12
    }
    
    public func setAppearence(style: MainButtonStyle) {
        switch style {
            
        case .fill:
            self.backgroundColor = AccentColors.mainBlue
            self.setTitleColor(.white, for: .normal)
        case .plain:
            self.backgroundColor = .clear
            self.setTitleColor(AccentColors.mainBlue, for: .normal)
            self.layer.borderWidth = 1
            self.layer.borderColor = AccentColors.mainBlue?.cgColor
        case .greyFill:
            self.backgroundColor = AccentColors.unselectedIcon
            self.setTitleColor(.white, for: .normal)
            
        }
    }
    
    public func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
    }
}

#Preview("MainButton", traits: .fixedLayout(width: 312, height: 48)) {
    let button = MainButton(appearence: .plain, title: "Hi")
    button.setTitle("Next")
    return button
}
