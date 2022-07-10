//
//  LoginMainViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class LoginMainViewController: UIViewController {

    // MARK: Properties

    private let validationService: ValidationService
    private let loginService: LoginService
    private let alertFactory: AlertFactory
    private let router: LoginSceneRouter

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()


    // MARK: Intialization

    init(
        router: LoginSceneRouter,
        validationService: ValidationService,
        loginService: LoginService,
        alertFactory: AlertFactory
    ) {
        self.validationService = validationService
        self.loginService = loginService
        self.alertFactory = alertFactory
        self.router = router

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Methods

    @objc private func loginButtonTapped() {

        let login = loginTextField.text
        let pwd = passwordTextField.text
        
        validationService.validate(login: login, and: pwd) { success, error in
            guard success
            else {
                if let error = error {
                    self.alertFactory.showAlert(with: error)
                }
                return
            }

            self.loginService.login(login: login!, pwd: pwd!) { success, error in
                self.router.routeToTrainingScene()
            }
        }
    }

    @objc private func signUpButtonTapped() {

    }

    @objc private func forgotPasswordButtonTapped() {

    }
}
