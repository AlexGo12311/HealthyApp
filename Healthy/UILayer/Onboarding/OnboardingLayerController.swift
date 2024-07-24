//
//  OnboardingLayerController.swift
//  Healthy
//
//  Created by Alex Neumark on 24.07.2024.
//

import UIKit

class OnboardingLayerController: UIViewController {

    var image: UIImage
    var titleText: String
    var descriptionText: String
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    init(image: UIImage, titleText: String, descriptionText: String) {
        self.image = image
        self.titleText = titleText
        self.descriptionText = descriptionText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Fatal Error!")
    }
    

}

// MARK: - Layout
private extension OnboardingLayerController {
    // Setup all views
    func setupLayout () {
        setupImageView()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 47),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -337),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 337)
        ])
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = titleText
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 65),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = .Montserrat.Bold.size(of: 32)
        titleLabel.textColor = AccentColors.mainBlue
    }
    
    func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.text = descriptionText
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .Montserrat.Regular.size(of: 16)
        descriptionLabel.textColor = AccentColors.mainBlue
    }
}
