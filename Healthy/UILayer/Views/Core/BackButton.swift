//
//  BackButton.swift
//  Healthy
//
//  Created by Alex Neumark on 12.08.2024.
//

import UIKit

class BackButton: UIButton {
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = AccentColors.shadowColor?.cgColor
        self.layer.shadowOpacity = 0.08
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(resource: .back)
        return image
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(image)
        image.frame = self.bounds
    }
}
