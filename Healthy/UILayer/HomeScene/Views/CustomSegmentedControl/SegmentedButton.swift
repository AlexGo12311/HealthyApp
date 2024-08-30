//
//  SegmentedButton.swift
//  Healthy
//
//  Created by Alex Neumark on 30.08.2024.
//

import UIKit

class SegmentedButton: UIButton {
    
    var isActive = false {
        didSet {
            changeTitleColor()
        }
    }
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(AccentColors.textColor
                      , for: .normal)
        titleLabel?.font = .Montserrat.Regular.size(of: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeTitleColor() {
        if isActive {
            setTitleColor(.white, for: .normal)
        } else {
            setTitleColor(AccentColors.textColor, for: .normal)
        }
    }
    
    
    
}


//#Preview("Segmented", traits: .fixedLayout(width: 150, height: 100)) {
//    SegmentedButton(title: "Hello, world!")
//}
