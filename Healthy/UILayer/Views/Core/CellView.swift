//
//  CellView.swift
//  Healthy
//
//  Created by Alex Neumark on 01.09.2024.
//

import UIKit

class CellView: UIView {
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let view: UIView = {
        let button = UIView()
        button.backgroundColor = .white
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.SemiBold.size(of: 14)
        label.textColor = AccentColors.blackColor
        return label
    }()
    
    let mainTextLabel: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.Regular.size(of: 12)
        label.textColor = AccentColors.blackColor
        label.numberOfLines = 0
        return label
    }()
    
    let mainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    init() {
        super.init(frame: .zero)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupCell() {
        setupMainView()
        setupView()
        setupImage()
        setupTitle()
        setupText()
    }
    
    
    
    func setupMainView() {
        addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupView() {
        mainView.addSubview(view)
        setupShadow(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: mainView.topAnchor),
            view.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupImage() {
        view.addSubview(mainImage)
        mainImage.layer.masksToBounds = true
        mainImage.clipsToBounds = true
        mainImage.layer.cornerRadius = 16
        
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            //            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            //            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -247/*-266*/)
            mainImage.widthAnchor.constraint(equalToConstant: 80),
            mainImage.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupTitle() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -78)
        ])
    }
    
    func setupText() {
        view.addSubview(mainTextLabel)
        mainTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTextLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 8),
            mainTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            //            mainTextLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
}

//#Preview("CellView", traits: .fixedLayout(width: 343, height: 112)) {
//    let cellView = CellView()
//    cellView.titleLabel.text = "ACAXsdfsdfsdf"
//    cellView.mainTextLabel.text = "CsadasDad"
//    cellView.mainImage.image = UIImage(resource: .investigations1)
//    return cellView
//    
//}
