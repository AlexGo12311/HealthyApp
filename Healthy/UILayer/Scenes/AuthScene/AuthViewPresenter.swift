//
//  AuthViewPresenter.swift
//  Healthy
//
//  Created by Alex Neumark on 29.07.2024.
//

import UIKit

protocol AuthOutput: AnyObject {
    func loginStart()
    func registrationStart()
    func goToSignIn()
    func goToSignUp()
    func goToForgot()
    func goToPrevious()
}

class AuthPresenter {
    private var coordinator: AppCoordinator?
    weak var input: AuthInput?
    
    init(coordinator: AppCoordinator? = nil, input: AuthInput? = nil) {
        self.coordinator = coordinator
        self.input = input
    }
}

extension AuthPresenter: AuthOutput {
    func loginStart() {
    }
    
    func registrationStart() {
        
    }
    
    func goToSignIn() {
        
    }
    
    func goToSignUp() {
        
    }
    
    func goToForgot() {
        
    }
    
    func goToPrevious() {
        
    }
    
    
}
