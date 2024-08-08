//
//  HomeViewController.swift
//  Healthy
//
//  Created by Alex Neumark on 05.08.2024.
//

import UIKit

class SearchViewController: UIViewController {

    private var searchFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SymptomsTableViewCell.self, forCellReuseIdentifier: SymptomsTableViewCell.indentifier)
        return table
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AccentColors.bgColor
        view.addSubview(searchFeedTable)
        setupLayout()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        searchFeedTable.frame = view.bounds
    }

}

private extension SearchViewController {
    func setupLayout() {
        setupSearchFeedTable()
        setupHeaderView()
    }
    
    func setupHeaderView() {
        searchFeedTable.tableHeaderView = SearchHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 220))
    }
    
    func setupSearchFeedTable() {
        searchFeedTable.delegate = self
        searchFeedTable.dataSource = self
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SymptomsTableViewCell.indentifier, for: indexPath) as? SymptomsTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 0
//    }
    
    
}
    
    

