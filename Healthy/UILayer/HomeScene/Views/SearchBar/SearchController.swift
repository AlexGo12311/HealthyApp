//
//  SearchController.swift
//  Healthy
//
//  Created by Alex Neumark on 03.09.2024.
//

import UIKit

class SearchController: UIViewController {
    
    private let searchBar = SearchField()
    
    private let searchFeed: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let backButton: UIButton = {
        var backButton = UIButton()
        var image = UIImage(resource: .vector)
        image = image.withRenderingMode(.alwaysTemplate)
        backButton.tintColor = AccentColors.mainBlue
        backButton.setImage(image, for: .normal)
        return backButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AccentColors.bgColor
        title = "Search"
        setupLayouts()
    }
    
    fileprivate func setupLayouts() {
        setupBackButton()
        setupSearchBar()
        setupTableView()
    }
    
    @objc private func goToBack() {
        navigationController?.popViewController(animated: false)
    }


}

fileprivate extension SearchController {
    func setupBackButton() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 48),
            backButton.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupSearchBar() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: backButton.trailingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupTableView() {
        view.addSubview(searchFeed)
        searchFeed.dataSource = self
        searchFeed.delegate = self
        searchFeed.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchFeed.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            searchFeed.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchFeed.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            searchFeed.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}

extension SearchController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello, World!"
        return cell
    }
}
