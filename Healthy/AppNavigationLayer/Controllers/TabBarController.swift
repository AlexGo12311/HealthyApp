//
//  TabBarController.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    var customTabBarView = UIView(frame: .zero)
    
    init(controllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in controllers {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tabBar.setCustomStyle()
    }
    
    override func viewDidLayoutSubviews() {
        tabBar.setCustomStyle()
    }
}

extension UITabBar {
    func setCustomStyle() {
        let appearence = UITabBarAppearance()
        appearence.backgroundColor = .white
        self.scrollEdgeAppearance = appearence
        self.standardAppearance = appearence
        self.layer.cornerRadius = CGFloat(24.0)
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Для закругления именно сверху
        
        let shadowLayer = CALayer()
        shadowLayer.frame = self.frame
        shadowLayer.cornerRadius = self.layer.cornerRadius
        shadowLayer.backgroundColor = UIColor.white.cgColor // Делаем его белым как основной фон
        shadowLayer.shadowOffset = CGSize(width: 0, height: 0)
        shadowLayer.shadowRadius = 10 /*30*/
        shadowLayer.shadowColor = AccentColors.shadowColor?.cgColor
        shadowLayer.shadowOpacity = 0.08 /*0.25*/
        
        // Добавляем слой с тенью под таббар
        if let superview = self.superview {
            superview.layer.insertSublayer(shadowLayer, below: self.layer)
        }
        
        self.layer.masksToBounds = true
        self.tintColor = AccentColors.mainBlue
        self.itemPositioning = .centered
        self.itemWidth = 65.0
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.Montserrat.Regular.size(of: 10)], for: .normal)
    }
}



