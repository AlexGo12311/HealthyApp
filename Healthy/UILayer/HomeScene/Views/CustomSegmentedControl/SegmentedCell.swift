//
//  SegmentedCell.swift
//  Healthy
//
//  Created by Alex Neumark on 30.08.2024.
//

import UIKit

class SegmentedCell: UITableViewCell {

    static let identifier = "SegmentedCell"
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = AccentColors.bgColor
        return view
    }()
    
    private lazy var postsView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var articlesView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var noInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "No information"
        label.textColor = AccentColors.textGray
        label.font = .Montserrat.SemiBold.size(of: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let segmentedControl = HealthySegmentedControl(buttonText: "Posts", "Articles")
    
    private var currentView: UIView?
    private var isPostsLoaded = false
    private var isArticlesLoaded = false
    
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
        contentView.addSubview(view)
        setupSegmentedButton()
        setupPostsView()
        setupArticlesView()
    }
    
    func setupSegmentedButton() {
        view.addSubview(segmentedControl)
        segmentedControl.delegate = self
        setupShadow(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupPostsView() {
        view.addSubview(postsView)
        
        NSLayoutConstraint.activate([
            postsView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            postsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        postsView.isHidden = true
    }
    
    func setupArticlesView() {
        view.addSubview(articlesView)
        
        NSLayoutConstraint.activate([
            articlesView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            articlesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            articlesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            articlesView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        articlesView.isHidden = true
        articlesView.addSubview(noInfoLabel)
        
        NSLayoutConstraint.activate([
            noInfoLabel.centerYAnchor.constraint(equalTo: articlesView.centerYAnchor, constant: -85),
            noInfoLabel.centerXAnchor.constraint(equalTo: articlesView.centerXAnchor)
        ])
    }
    
    func loadPostsContent() {
        if !isPostsLoaded {
            let titles = ["Hello, World", "Hello, World", "Hello, World"]
            let texts = ["Lorem ipsum dollam", "Lorem ipsum dollam", "Lorem ipsum dollam"]
            let images = [UIImage(resource: .investigations1), UIImage(resource: .investigations2), UIImage(resource: .investigations3)]
            
            postsView.arrangedSubviews.forEach { $0.removeFromSuperview() } // Clear previous content
            
            images.enumerated().forEach {
                let button = CellView()
                button.mainImage.image = $0.element
                button.mainTextLabel.text = texts[$0.offset]
                button.titleLabel.text = titles[$0.offset]
                button.tag = $0.offset
                postsView.addArrangedSubview(button)
            }
            isPostsLoaded = true // Помечаем, что контент загружен
        }
    }
    
    func switchView(to: UIView) {
        [postsView, articlesView].forEach { $0.isHidden = true }
        to.isHidden = false
        currentView = to
        
        if to == postsView && !isPostsLoaded {
            loadPostsContent()
        } else if to == articlesView && !isArticlesLoaded {
            loadArticlesContent()
        }
    }
    
    func loadArticlesContent() {
        // В этом месте вы можете добавить логику загрузки контента для articlesView
        isArticlesLoaded = true // Помечаем, что контент загружен
    }
}

extension SegmentedCell: HealthySegmentedControlDelegate {
    func segmentedDidTapped(_ sender: SegmentedButton) {
        switch sender.tag {
        case 0:
            switchView(to: postsView)
        case 1:
            switchView(to: articlesView)
        default:
            break
        }
    }
}

