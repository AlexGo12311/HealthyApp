//
//  AuthViewPresenter.swift
//  Healthy
//
//  Created by Alex Neumark on 29.07.2024.
//

import UIKit

protocol AuthOutput: AnyObject {
    func loginStart(login: String, password: String)
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

extension AuthPresenter {
    func goToMainFlow() {
        coordinator?.showMainScene()    }
}

extension AuthPresenter: AuthOutput {
    func loginStart(login: String, password: String) {
        input?.startLoader()
        if login.lowercased() == "test" && password == "123" {
            DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
                DispatchQueue.main.async {
                    self.goToMainFlow()
                }
                
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                print("Password is wrong")
                self.input?.stopLoader()
            }
        }
    }
    
    func registrationStart() {
        
    }
    
    func goToSignIn() {
        coordinator?.showAuthLoginScene()
    }
    
    func goToSignUp() {
        coordinator?.showAuthSignUpScene()
    }
    
    func goToForgot() {
        
    }
    
    func goToPrevious() {
        
    }
    
    
}
