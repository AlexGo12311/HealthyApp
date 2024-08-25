//
//  HomeViewController.swift
//  Healthy
//
//  Created by Alex Neumark on 22.08.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    struct NearestResurces {
        static let doctorName: String = "Dr. Charollette Baker"
        static let doctorType: String = "Pediatrician"
        static let image = UIImage.init(resource: .doctor)
        static let date = "Monday, Dec 23"
        static let time = "12:00-13:00"
    }
    
    private enum sections: Int {
        case search
        case nearestVisit
    }
    
    let homeFeedTabel: UITableView = {
        let tabel = UITableView(frame: .zero, style: .grouped)
        tabel.register(SearchBarCell.self, forCellReuseIdentifier: SearchBarCell.identifier)
        tabel.register(NearestTableViewCell.self, forCellReuseIdentifier: NearestTableViewCell.identifier)
        return tabel
    }()
    
    private let sectionTitles = [" ", "Nearest visit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeFeedTabel)
        setupLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let safeAreaInsets = view.safeAreaInsets
        let safeAreaFrame = CGRect(
            x: safeAreaInsets.left,
            y: safeAreaInsets.top,
            width: view.bounds.width - safeAreaInsets.left - safeAreaInsets.right,
            height: view.bounds.height - safeAreaInsets.top - safeAreaInsets.bottom
        )
        
        
        
        homeFeedTabel.frame = safeAreaFrame
        homeFeedTabel.backgroundColor = AccentColors.bgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}

private extension HomeViewController {
    func setupLayout() {
        setupHomeFeedTable()
    }
    
    func setupHomeFeedTable() {
        homeFeedTabel.delegate = self
        homeFeedTabel.dataSource = self
        homeFeedTabel.showsVerticalScrollIndicator = false
        homeFeedTabel.showsHorizontalScrollIndicator = false
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case sections.search.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchBarCell.identifier, for: indexPath) as? SearchBarCell else { return UITableViewCell() }
            setupShadow(cell)
            return cell
        case sections.nearestVisit.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NearestTableViewCell.identifier, for: indexPath) as? NearestTableViewCell else { return UITableViewCell() }
            cell.configure(doctorName: NearestResurces.doctorName, doctorType: NearestResurces.doctorType, doctorPhoto: NearestResurces.image, raiting: 4.78, date: NearestResurces.date, time: NearestResurces.time)
            setupShadow(cell)
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case sections.search.rawValue:
            return 48
        case sections.nearestVisit.rawValue:
            return 230
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .Montserrat.SemiBold.size(of: 16)
        header.textLabel?.textColor = AccentColors.textGray
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == sections.search.rawValue {
            return 8
        }
        return 28
    }
}

extension HomeViewController: NearestTableViewCellDelegate {
    func didTappedReschedule() {
        let alert = UIAlertController(title: "Work in progress", message: "We're don't add this function yet. Wait a new updates", preferredStyle: .alert)
        let actions = UIAlertAction(title: "OK", style: .default)
        alert.addAction(actions)
        self.present(alert, animated: true)
    }
    
    func didTappedCancel() {
        let alert = UIAlertController(title: "Work in progress", message: "We're don't add this function yet. Wait a new updates", preferredStyle: .alert)
        let actions = UIAlertAction(title: "OK", style: .default)
        alert.addAction(actions)
        self.present(alert, animated: true)
    }
    
    
}
