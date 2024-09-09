//
//  SearchBarCell.swift
//  Healthy
//
//  Created by Alex Neumark on 25.08.2024.
//
protocol SearchBarCellDelegate: AnyObject {
    func searchBarDidTapped()
}

import UIKit

class SearchBarCell: UITableViewCell {
    
    static let identifier = "SearchBarCell"
    weak var delegate: SearchBarCellDelegate?
    private let searchBar = HealthSearchBar()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.addSubview(searchBar)
        searchBar.frame = contentView.bounds
    }
    
    private func setupSearchBar() {
        let tapGeasture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        searchBar.addGestureRecognizer(tapGeasture)
        searchBar.isUserInteractionEnabled = true
    }
    
    @objc private func viewTapped(){
        delegate?.searchBarDidTapped()
    }
    
}

