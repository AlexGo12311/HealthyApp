//
//  CustomButtonForCollection.swift
//  Healthy
//
//  Created by Alex Neumark on 10.08.2024.
//

import UIKit

enum CollectionButtonStyle {
    case headache
    case nausea
    case temperature
    case cough
}

class CustomButtonForCollection: UIView {
    
//    private let button = UIButton()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .Montserrat.SemiBold.size(of: 14)
        label.textColor = AccentColors.blackColor
        return label
    }()
    
    private lazy var headacheImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(resource: .headache)
        return image
    }()
    
    private lazy var nauseaImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(resource: .nausea)
        return image
    }()
    
    private lazy var temperatureImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(resource: .temperature)
        return image
    }()
    
    private lazy var coughImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(resource: .cough)
        return image
    }()
    
    private let style: CollectionButtonStyle
    
    init(style: CollectionButtonStyle) {
        self.style = style
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func layoutSubviews() {
        switch style {
        case .headache:
            setupHeadache()
        case .nausea:
            setupNausea()
        case .temperature:
            setupTemperature()
        case .cough:
            setupCough()
        }
    }
    
    private func setupHeadache() {
        backgroundColor = .white
        layer.cornerRadius = 16
        addSubview(headacheImage)
        headacheImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headacheImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            headacheImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            headacheImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            headacheImage.widthAnchor.constraint(equalToConstant: 32),
            headacheImage.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        self.addSubview(label)
        label.text = "Headache"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headacheImage.trailingAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
    
    private func setupNausea() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.addSubview(nauseaImage)
        nauseaImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nauseaImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nauseaImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            nauseaImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            nauseaImage.widthAnchor.constraint(equalToConstant: 32),
            nauseaImage.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        self.addSubview(label)
        label.text = "Nausea"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: nauseaImage.trailingAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
    
    private func setupTemperature() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.addSubview(temperatureImage)
        temperatureImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            temperatureImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            temperatureImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            temperatureImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            temperatureImage.widthAnchor.constraint(equalToConstant: 32),
            temperatureImage.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        self.addSubview(label)
        label.text = "Temperature"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: temperatureImage.trailingAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
    
    private func setupCough() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.addSubview(coughImage)
        coughImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coughImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            coughImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            coughImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            coughImage.widthAnchor.constraint(equalToConstant: 32),
            coughImage.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        self.addSubview(label)
        label.text = "Cough"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: coughImage.trailingAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
    
}


//#Preview("Button", traits: .fixedLayout(width: 120, height: 48)) {
//    
//    CustomButtonForCollection(style: .cough)
//}
