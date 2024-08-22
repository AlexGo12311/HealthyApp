//
//  SearchCollectionCell.swift
//  Healthy
//
//  Created by Alex Neumark on 06.08.2024.
//

import UIKit

class SearchCollectionCell: UICollectionViewCell {
    // MARK: - Views
    let headache = CustomButtonForCollection(style: .headache)
    let nausea = CustomButtonForCollection(style: .nausea)
    let temperature = CustomButtonForCollection(style: .temperature)
    let cough = CustomButtonForCollection(style: .cough)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with: CollectionButtonStyle) {
        switch with {
            
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
        contentView.addSubview(headache)
        
        headache.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headache.topAnchor.constraint(equalTo: contentView.topAnchor),
            headache.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            headache.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            headache.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
    
    private func setupNausea() {
        contentView.addSubview(nausea)
        
        nausea.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nausea.topAnchor.constraint(equalTo: contentView.topAnchor),
            nausea.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            nausea.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            nausea.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
    
    private func setupTemperature() {
        contentView.addSubview(temperature)
        
        temperature.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            temperature.topAnchor.constraint(equalTo: contentView.topAnchor),
            temperature.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            temperature.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            temperature.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
    
    private func setupCough() {
        contentView.addSubview(cough)
        
        cough.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cough.topAnchor.constraint(equalTo: contentView.topAnchor),
            cough.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cough.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            cough.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
}
