//
//  SymptomsTableViewCell.swift
//  Healthy
//
//  Created by Alex Neumark on 07.08.2024.
//

import UIKit

class SymptomsTableViewCell: UITableViewCell {
    static let indentifier = "SymptomsTableViewCell"
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 145, height: 48)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .red
        setupCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollection() {
        contentView.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .brown
        collection.register(SearchCollectionCell.self, forCellWithReuseIdentifier: "SearchCollectionCell")
        collection.delegate = self
        collection.dataSource = self
    }
    
    override func layoutSubviews() {
        collection.frame = contentView.bounds
    }
}

extension SymptomsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as? SearchCollectionCell else { return  UICollectionViewCell() }
        return cell
    }
}
    
    

