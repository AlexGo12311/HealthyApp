//
//  ButtonStackCell.swift
//  Healthy
//
//  Created by Alex Neumark on 09.08.2024.
//

import UIKit
protocol ButtonStackCellDelegate: AnyObject {
    func didDoctorsButtonStackCellPressed()
    func didPharmacyButtonStackCellPressed()
    func didHospitalButtonStackCellPressed()
}

class ButtonStackCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "ButtonStackCell"
    weak var delegate: ButtonStackCellDelegate?
    
    // MARK: - Views
    private let doctorsButton = CustomButtonForStack(buttonStyle: .doctors)
    private let pharmacyButton = CustomButtonForStack(buttonStyle: .pharmacy)
    private let hospitalsButton = CustomButtonForStack(buttonStyle: .hospitals)
    private let stack = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupShadow(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        guard let sender = sender.view else { return }
        switch sender {
        case doctorsButton:
            delegate?.didDoctorsButtonStackCellPressed()
        case pharmacyButton:
            delegate?.didPharmacyButtonStackCellPressed()
        case hospitalsButton:
            delegate?.didHospitalButtonStackCellPressed()
        default:
            break
        }
        
    }
    
    func setupLayout() {
        setupStack()
        setupDoctorsButton()
        setupPharmacyButton()
        setupHospitalsButton()
    }
    
    private func setupStack() {
        contentView.addSubview(stack)
        stack.axis = .horizontal
        stack.spacing = 16 /*24*/
        stack.distribution = .fillEqually
        
        stack.addArrangedSubview(doctorsButton)
        stack.addArrangedSubview(pharmacyButton)
        stack.addArrangedSubview(hospitalsButton)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupDoctorsButton() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        doctorsButton.addGestureRecognizer(tapGesture)
        doctorsButton.isUserInteractionEnabled = true
    }
    
    private func setupPharmacyButton() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        pharmacyButton.addGestureRecognizer(tapGesture)
        pharmacyButton.isUserInteractionEnabled = true

    }
    
    private func setupHospitalsButton() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        hospitalsButton.addGestureRecognizer(tapGesture)
        hospitalsButton.isUserInteractionEnabled = true
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
