//
//  SearchBarCell.swift
//  Healthy
//
//  Created by Alex Neumark on 25.08.2024.
//

import UIKit

class SearchBarCell: UITableViewCell {
    
    static let identifier = "SearchBarCell"
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let magniferGlassImage: UIImageView = {
        let image = UIImageView()
        image.image = .magnifer
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.Montserrat.Regular.size(of: 14)
        label.textColor = AccentColors.searchColor
        label.text = "Search"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.addSubview(mainView)
        mainView.frame = contentView.bounds
    }
    
}

private extension SearchBarCell {
    func setupLayout() {
        setupView()
        setupMagniferGlassImage()
        setupLabel()
    }
    
    func setupView() {
        mainView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            view.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            view.topAnchor.constraint(equalTo: mainView.topAnchor),
            view.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        ])
    }
    
    func setupMagniferGlassImage() {
        view.addSubview(magniferGlassImage)
        magniferGlassImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            magniferGlassImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            magniferGlassImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            magniferGlassImage.widthAnchor.constraint(equalToConstant: 28),
            magniferGlassImage.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func setupLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: magniferGlassImage.trailingAnchor, constant: 4),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
