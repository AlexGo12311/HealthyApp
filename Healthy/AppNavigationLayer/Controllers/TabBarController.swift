//
//  TabBarController.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(controllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in controllers {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
