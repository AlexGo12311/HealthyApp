//
//  SearchHeaderUIView.swift
//  Healthy
//
//  Created by Alex Neumark on 08.08.2024.
//

import UIKit

class SearchHeaderUIView: UIView {
    
    // MARK: - Views
    private let insulinImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(resource: .searchBackground)
        image.backgroundColor = AccentColors.insulinImage
        return image
    }()
    
    private let quicklyImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(resource: .quickly)
        return image
    }()
    
    private let searchField = SearchField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        self.addSubview(insulinImage)
        setupSearchField()
        setupQuickyImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        insulinImage.layer.cornerRadius = 20
        insulinImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            insulinImage.topAnchor.constraint(equalTo: self.topAnchor),
            insulinImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            insulinImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            insulinImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
            
        ])
    }
    
    
    func setupSearchField() {
        self.addSubview(searchField)
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: insulinImage.topAnchor, constant: 152),
            searchField.bottomAnchor.constraint(equalTo: insulinImage.bottomAnchor, constant: -19),
            searchField.leadingAnchor.constraint(equalTo: insulinImage.leadingAnchor , constant: 16),
            searchField.trailingAnchor.constraint(equalTo: insulinImage.trailingAnchor, constant: -16)
        ])
    }
    
    func setupQuickyImage() {
        self.addSubview(quicklyImage)
        quicklyImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quicklyImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 67),
            quicklyImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -85),
            quicklyImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42),
            quicklyImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -39)
        ])

    }
    
    

}
