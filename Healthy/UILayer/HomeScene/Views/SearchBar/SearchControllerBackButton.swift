//
//  SearchControllerBackButton.swift
//  Healthy
//
//  Created by Alex Neumark on 04.09.2024.
//

import UIKit

class SearchControllerBackButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        var image = UIImage(resource: .vector)
        image = image.withRenderingMode(.alwaysTemplate)
        self.tintColor = AccentColors.mainBlue
        self.setImage(image, for: .normal)
    }

}
