//
//  ViewController.swift
//  Healthy
//
//  Created by Alex Neumark on 22.07.2024.
//

import UIKit

class ViewController: UIViewController {

    var testLabel: UILabel = {
        let testLabel = UILabel()
        testLabel.text = "Hello, world!"
        testLabel.textColor = .white
        testLabel.font = .Montserrat.BoldItalic.size(of: 24)
        testLabel.textAlignment = .center
        
        return testLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        configureTest()
        
    }
    
    func configureTest() {
        view.addSubview(testLabel)
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            testLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            testLabel.widthAnchor.constraint(equalToConstant: 200.0),
            testLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }


}

