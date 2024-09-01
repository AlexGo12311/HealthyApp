//
//  HealthySegmentedControl.swift
//  Healthy
//
//  Created by Alex Neumark on 29.08.2024.
//

import UIKit

protocol HealthySegmentedControlDelegate: AnyObject {
    func segmentedDidTapped(_ sender: SegmentedButton)
}

class HealthySegmentedControl: UIView {
    
    weak var delegate: HealthySegmentedControlDelegate?
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private let selectedView = UIView()
    private var widthConstraint = NSLayoutConstraint()
    private var leadingConstraint = NSLayoutConstraint()
    private var buttonArray = [SegmentedButton]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(buttonText: String...) {
        self.init()
        buttonText.enumerated().forEach {
            let button = SegmentedButton(title: $0.element)
            button.tag = $0.offset
            button.addTarget(self, action: #selector(segmentedButtonTapped), for: .touchUpInside)
            buttonArray.append(button)
            stackView.addArrangedSubview(button)
        }
        
        DispatchQueue.main.async {
            guard let choosenButton = self.buttonArray.first else { return }
            choosenButton.isActive = true
            self.delegate?.segmentedDidTapped(choosenButton)
            self.widthConstraint.constant = self.stackView.arrangedSubviews[0].frame.width
        }
    }
    
    @objc private func segmentedButtonTapped(sender: SegmentedButton) {
        widthConstraint.constant = stackView.arrangedSubviews[sender.tag].frame.width
        leadingConstraint.constant = stackView.arrangedSubviews[sender.tag].frame.origin.x
        
        delegate?.segmentedDidTapped(sender)
        
        UIView.animate(withDuration: 0.3) {
            self.buttonArray.forEach { button in
                let isActive = (button == sender)
                
                // Анимация изменения цвета текста
                UIView.transition(with: button, duration: 0.3, options: .transitionCrossDissolve, animations: {
                    button.isActive = isActive
                })
                
                self.stackView.layoutIfNeeded()
            }
        }
    }
    
//    @objc private func segmentedButtonTapped(sender: SegmentedButton) {
//        widthConstraint.constant = stackView.arrangedSubviews[sender.tag].frame.width
//        leadingConstraint.constant = stackView.arrangedSubviews[sender.tag].frame.origin.x
//
//        UIView.animate(withDuration: 0.3, animations: {
//            self.stackView.layoutIfNeeded()
//        }, completion: { _ in
//            // После завершения анимации меняем состояние кнопок
//            self.buttonArray.forEach {
//                $0.isActive = ($0 == sender)
//            }
//        })
//    }

    
}


private extension HealthySegmentedControl {
    func configureLayout() {
        configureView()
        configureStackView()
        configureSelectedView()
    }
    
    func configureView() {
        layer.cornerRadius = 10
        backgroundColor = .white
    }
    
    func configureStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
    
    func configureSelectedView() {
        selectedView.backgroundColor = AccentColors.mainBlue
        selectedView.layer.cornerRadius = 12
        stackView.addSubview(selectedView)
        selectedView.translatesAutoresizingMaskIntoConstraints = false
        
        widthConstraint = selectedView.widthAnchor.constraint(equalToConstant: 0)
        leadingConstraint = selectedView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
        widthConstraint.isActive = true
        leadingConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            selectedView.topAnchor.constraint(equalTo: stackView.topAnchor),
            selectedView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
}
