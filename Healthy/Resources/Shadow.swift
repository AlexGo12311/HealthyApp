//
//  Shadow.swift
//  Healthy
//
//  Created by Alex Neumark on 12.08.2024.
//

import UIKit

public func setupShadow(_ cell: UITableViewCell) {
    cell.layer.shadowColor = AccentColors.shadowColor?.cgColor
    cell.layer.shadowOpacity = 0.05
    cell.layer.shadowOffset = CGSize(width: 0, height: 0)
    cell.layer.shadowRadius = 10
    cell.layer.masksToBounds = false
}

public func setupShadow(_ view: UIView) {
    view.layer.shadowColor = AccentColors.shadowColor?.cgColor
    view.layer.shadowOpacity = 0.05
    view.layer.shadowOffset = CGSize(width: 0, height: 0)
    view.layer.shadowRadius = 10
    view.layer.masksToBounds = false
}
