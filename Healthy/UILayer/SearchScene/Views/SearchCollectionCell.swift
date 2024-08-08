//
//  SearchCollectionCell.swift
//  Healthy
//
//  Created by Alex Neumark on 06.08.2024.
//

import UIKit

class SearchCollectionCell: UICollectionViewCell {
    // MARK: - Views
    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.backgroundColor = .blue
        setupView()
    }
    
    func setupView() {
        contentView.addSubview(view)
        view.backgroundColor = .green
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            view.heightAnchor.constraint(equalToConstant: 48),
            view.widthAnchor.constraint(equalToConstant: 145)
        ])
    }
}
