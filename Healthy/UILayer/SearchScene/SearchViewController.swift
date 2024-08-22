//
//  HomeViewController.swift
//  Healthy
//
//  Created by Alex Neumark on 05.08.2024.
//

import UIKit

enum sectionsForSearchScene: Int {
    case buttonStack
    case symptoms
    case newInvestigation1
    case newInvestigation2
    case newInvestigation3
}

private struct newInvestigationTitles {
    static let images: (glass: UIImage, heart: UIImage, bottle: UIImage) = (UIImage(resource: .investigations1), UIImage(resource: .investigations2), UIImage(resource: .investigations3))
    static let titles = ["What is the Replication Crisis?", "Cardiology and pregnancy?", "What is the Replication Crisis?"]
    static let texts = ["This article will look at this subject, providing a brief overview of this subject.", "Although approximately 86% of practicing cardiologists surveyed see patients who are pregnant ever...", "This article will look at this subject, providing a brief overview of this subject."]
}

class SearchViewController: UIViewController {
    let sectionTitles = [" ", "Your symptoms", "New investigations", " ", " "]
    private var searchFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SymptomsTableViewCell.self, forCellReuseIdentifier: SymptomsTableViewCell.indentifier)
        table.register(ButtonStackCell.self, forCellReuseIdentifier: ButtonStackCell.identifier)
        table.register(NewInvestigationCell.self, forCellReuseIdentifier: NewInvestigationCell.indentifier)
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
        searchFeedTable.backgroundColor = AccentColors.bgColor
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
        searchFeedTable.showsVerticalScrollIndicator = false
        searchFeedTable.showsHorizontalScrollIndicator = false
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case sectionsForSearchScene.buttonStack.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonStackCell.identifier, for: indexPath) as? ButtonStackCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        case sectionsForSearchScene.symptoms.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SymptomsTableViewCell.indentifier, for: indexPath) as? SymptomsTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
            
        case sectionsForSearchScene.newInvestigation1.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewInvestigationCell.indentifier, for: indexPath) as? NewInvestigationCell else { return UITableViewCell() }
            cell.configureCell(with: newInvestigationTitles.images.glass, title: newInvestigationTitles.titles[0], and: newInvestigationTitles.texts[0])
            cell.delegate = self
            return cell
        case sectionsForSearchScene.newInvestigation2.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewInvestigationCell.indentifier, for: indexPath) as? NewInvestigationCell else { return UITableViewCell() }
            cell.configureCell(with: newInvestigationTitles.images.heart, title: newInvestigationTitles.titles[1], and: newInvestigationTitles.texts[1])
            cell.delegate = self
            return cell
        case sectionsForSearchScene.newInvestigation3.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewInvestigationCell.indentifier, for: indexPath) as? NewInvestigationCell else { return UITableViewCell() }
            cell.configureCell(with: newInvestigationTitles.images.bottle, title: newInvestigationTitles.titles[2], and: newInvestigationTitles.texts[2])
            cell.delegate = self
            return cell
            
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case sectionsForSearchScene.buttonStack.rawValue:
            return 88
        case sectionsForSearchScene.symptoms.rawValue:
            return 48
        case sectionsForSearchScene.newInvestigation1.rawValue:
            return 112
        case sectionsForSearchScene.newInvestigation2.rawValue:
            return 112
        case sectionsForSearchScene.newInvestigation3.rawValue:
            return 112
        default:
            return UITableView.automaticDimension
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == sectionsForSearchScene.newInvestigation2.rawValue || section == sectionsForSearchScene.newInvestigation3.rawValue {
            return 0
        }
        return 24
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .Montserrat.SemiBold.size(of: 16)
        header.textLabel?.textColor = AccentColors.textGray
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    // MARK: - NavBar scrolls
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}


extension SearchViewController: SymptomsTableViewCellDelegate {
    func didTappedAtSymptomsTableViewCell(_ cell: SymptomsTableViewCell, index: Int) {
        switch index {
        case 0:
            let vc = ViewController()
            vc.title = "Headache"
            vc.view.backgroundColor = AccentColors.bgColor
            vc.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ViewController()
            vc.title = "Nausea"
            vc.view.backgroundColor = AccentColors.bgColor
            vc.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = ViewController()
            vc.title = "Temperature"
            vc.view.backgroundColor = AccentColors.bgColor
            vc.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = ViewController()
            vc.title = "Cough"
            vc.view.backgroundColor = AccentColors.bgColor
            vc.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
            navigationController?.pushViewController(vc, animated: true)
        default:
            let vc = ViewController()
            vc.title = "Default"
            vc.view.backgroundColor = AccentColors.bgColor
            
            vc.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension SearchViewController: ButtonStackCellDelegate {
    func didDoctorsButtonStackCellPressed() {
        let vc = ViewController()
        vc.title = "Doctors"
        vc.view.backgroundColor = AccentColors.bgColor
        vc.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didPharmacyButtonStackCellPressed() {
        let vc = ViewController()
        vc.title = "Pharmacy"
        vc.view.backgroundColor = AccentColors.bgColor
        vc.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didHospitalButtonStackCellPressed() {
        let vc = ViewController()
        vc.title = "Hospitals"
        vc.view.backgroundColor = AccentColors.bgColor
        vc.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchViewController: NewInvestigationCellDelegate {
    func didTappedNewInvestigation(sender: NewInvestigationCell) {
        let vc = ViewController()
        vc.title = "Investigations"
        vc.view.backgroundColor = AccentColors.bgColor
        vc.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        navigationController?.pushViewController(vc, animated: true)
    }
}


