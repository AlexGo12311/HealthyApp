//
//  AuthViewController.swift
//  Healthy
//
//  Created by Alex Neumark on 26.07.2024.
//

import UIKit
enum LoginViewState {
    case initial
    case login
    case signUp
}

protocol AuthInput: AnyObject {
    func onSignUpTaped()
    func onLoginTapped()
    func onForgotTapped()
    func onBottomPressed()
    func onBackPressed()
}

class AuthViewController: UIViewController {

    
    // MARK: - Properties
    private var state: LoginViewState = .initial
    weak var viewOutput: AuthOutput!
    // MARK: - Views
    private lazy var loginField = MainTextField()
    private lazy var passwordField = MainTextField()
    private lazy var bottomView = AuthBottomView()
    private lazy var label = UILabel()
    private lazy var label1 = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signUpButton = MainButton(appearence: .fill, title: "Sign Up")
    private lazy var loginButton = MainButton(appearence: .plain, title: "Login")
    private lazy var forgotButton = UIButton()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    // MARK: - Initializers
    init(output: AuthOutput, state: LoginViewState) {
        self.state = state
        self.viewOutput = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - View layout configuration by scene
    private func setupLayout() {
        switch state {
        case .initial:
            setupLabel()
            setupLabel1()
            setupLogoImage()
            setupSignUpButton()
            setupLoginButton()
        case .login:
            setupLabel()
            setupLabel1()
            setupLogoImage()
            setupLoginField()
            setupPasswordField()
            setupLoginButton()
            setupForgotButton()
            setupBottomView()
        case .signUp:
            setupLabel()
            setupLabel1()
            setupLogoImage()
            setupLoginField()
            setupBottomView()
        }
    }
 
}

private extension AuthViewController {
    func setupPasswordField() {
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.placeholder = "Password"
        
        NSLayoutConstraint.activate([
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 16),
            passwordField.heightAnchor.constraint(equalToConstant: 46),
            passwordField.widthAnchor.constraint(equalToConstant: 327)
        ])
    }
    
    func setupLoginField() {
        view.addSubview(loginField)
        loginField.translatesAutoresizingMaskIntoConstraints = false
        loginField.placeholder = "Email or number"
        
        NSLayoutConstraint.activate([
            loginField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 24),
            loginField.heightAnchor.constraint(equalToConstant: 46),
            loginField.widthAnchor.constraint(equalToConstant: 327)
        ])
    }
    
    func setupLabel() {
        view.addSubview(label)
        label.font = .Montserrat.Bold.size(of: 20)
        label.textColor = AccentColors.mainBlue
        switch self.state {
        case .initial:
            label.text = "Welcome to"
        case .login:
            label.text = "Welcome Back"
        case .signUp:
            label.text = "Hello Beautiful"
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
    }
    
    func setupLabel1() {
        view.addSubview(label1)
        label1.font = .Montserrat.Bold.size(of: 32)
        label1.textColor = AccentColors.mainBlue
        switch self.state {
        case .initial:
            label1.text = "Healthy"
        case .login:
            label1.text = "Login"
        case .signUp:
            label1.text = "Sign Up"
        }
        label1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 4)
        ])
    }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        switch self.state {
        case .initial:
            logoImage.image = UIImage(resource: .lifesaversBust)
        case .login:
            logoImage.image = UIImage(resource: .lifesaversBustSmall)
        case .signUp:
            logoImage.image = UIImage(resource: .lifesaversBustSmall)
        }
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 30)
        ])
    }
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 46),
            signUpButton.widthAnchor.constraint(equalToConstant: 327),
            signUpButton.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
    
    func setupLoginButton() {
        view.addSubview(loginButton)
        if self.state == .login {
            loginButton.setAppearence(style: .fill)
        }
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        switch self.state {
        case .initial:
            NSLayoutConstraint.activate([
                loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loginButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 16),
                loginButton.widthAnchor.constraint(equalToConstant: 327),
                loginButton.heightAnchor.constraint(equalToConstant: 42)
            ])
        case .login:
            NSLayoutConstraint.activate([
                loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 53),
                loginButton.widthAnchor.constraint(equalToConstant: 327),
                loginButton.heightAnchor.constraint(equalToConstant: 42)
            ])
        default:
            break
        }
    }
    
    func setupForgotButton() {
        view.addSubview(forgotButton)
        forgotButton.setTitle("Forgot Password?", for: .normal)
        forgotButton.setTitleColor(AccentColors.mainBlue, for: .normal)
        forgotButton.titleLabel?.font = .Montserrat.Light.size(of: 14)
        forgotButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forgotButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 8),
            forgotButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -34)
        ])
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 50)
        ])
        bottomView.action = buttonPressed
    }
    
}

extension AuthViewController: AuthInput {
    func onSignUpTaped() {
        
    }
    
    func onLoginTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    func onBottomPressed() {
        
    }
    
    func onBackPressed() {
        
    }
    
    
}



#Preview("AuthVC") {
    AuthViewController(output: AuthPresenter(), state: .login)
}
