//
//  SymptomsTableViewCell.swift
//  Healthy
//
//  Created by Alex Neumark on 07.08.2024.
//

import UIKit

protocol SymptomsTableViewCellDelegate: AnyObject {
    func didTappedAtSymptomsTableViewCell(_ cell: SymptomsTableViewCell, index: Int)
}

class SymptomsTableViewCell: UITableViewCell {
    static let indentifier = "SymptomsTableViewCell"
    
    weak var delegate: SymptomsTableViewCellDelegate?
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.sectionInset.left = 16
        layout.sectionInset.right = 16

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        setupCollection()
        setupShadow(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollection() {
        contentView.addSubview(collection)
        collection.backgroundColor = .clear
        collection.register(SearchCollectionCell.self, forCellWithReuseIdentifier: "SearchCollectionCell")
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
    }
    
    override func layoutSubviews() {
        collection.frame = contentView.bounds
    }
}

extension SymptomsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as? SearchCollectionCell else { return  UICollectionViewCell() }
            cell.setupCell(with: .headache)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as? SearchCollectionCell else { return  UICollectionViewCell() }
            cell.setupCell(with: .nausea)
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as? SearchCollectionCell else { return  UICollectionViewCell() }
            cell.setupCell(with: .temperature)
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as? SearchCollectionCell else { return  UICollectionViewCell() }
            cell.setupCell(with: .cough)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 0:
            return CGSize(width: 145, height: 48)
        case 1:
            return CGSize(width: 126, height: 48)
        case 2:
            return CGSize(width: 166, height: 48)
        case 3:
            return CGSize(width: 120, height: 48)
        default:
            return CGSize(width: 100, height: 48)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didTappedAtSymptomsTableViewCell(self, index: indexPath.row)
    }
}
    

    
    

