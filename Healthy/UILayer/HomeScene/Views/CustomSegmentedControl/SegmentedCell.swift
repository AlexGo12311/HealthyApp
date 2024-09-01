//
//  SegmentedCell.swift
//  Healthy
//
//  Created by Alex Neumark on 30.08.2024.
//

import UIKit
//H: 424

class SegmentedCell: UITableViewCell {
    
    static let identifier = "SegmentedCell"
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = AccentColors.bgColor
        return view
    }()
    
    private let informationView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let noInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "No information"
        label.textColor = AccentColors.textGray
        label.font = .Montserrat.SemiBold.size(of: 18)
        return label
    }()
    
    private let segmentedControl = HealthySegmentedControl(buttonText: "Posts", "Articles")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        view.frame = contentView.bounds
    }

}


fileprivate extension SegmentedCell {
    func setupLayout() {
        setupView()
        setupSegmentedButton()
        setupInformationView()
        setupNoInfoLabel()
    }
    
    func setupView() {
        contentView.addSubview(view)
    }
    
    func setupSegmentedButton() {
        view.addSubview(segmentedControl)
        setupShadow(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupInformationView() {
        view.addSubview(informationView)
        informationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            informationView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            informationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            informationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            informationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupNoInfoLabel() {
        informationView.addSubview(noInfoLabel)
        noInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noInfoLabel.centerYAnchor.constraint(equalTo: informationView.centerYAnchor, constant: -85),
            noInfoLabel.centerXAnchor.constraint(equalTo: informationView.centerXAnchor)
        ])
    }
}
