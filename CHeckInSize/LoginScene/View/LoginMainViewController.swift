//
//  LoginMainViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class LoginMainViewController: UIViewController {
    
    private let uikitTemplate = UIKitTemplate()

    // MARK: Properties

    private let validationService: ValidationService
    private let loginService: LoginService
    private let alertFactory: AlertFactory
    private let router: LoginSceneRouter
    private lazy var logo: UIStackView = uikitTemplate.logo
    private lazy var loginTextField: UITextField = UIComponentsFactory().makeTextField(with: "Номер телефона, эл. адрес или имя пользователя", fieldType: .loginScreenTextField)
    private lazy var passwordTextField: UITextField = UIComponentsFactory().makeTextField(with: "Пароль", fieldType: .loginScreenTextField)
    private lazy var forgotPasswordButton: UIButton = UIComponentsFactory().makeButton(with: "Забыли пароль?", buttonType: .buttonWithNunitoBoldUnderline, and: nil)
    private lazy var signInButton: UIButton = UIComponentsFactory().makeButton(with: "ВОЙТИ", buttonType: .blackButton, and: nil)
    private lazy var noAccountLabel: UILabel = UIComponentsFactory().makeLabel(with: "Еще нет аккаунта?", labelType: .labelWithNunito)
    private lazy var signUpButton: UIButton = UIComponentsFactory().makeButton(with: "Зарегистрируйтесь", buttonType: .buttonWithNunitoBoldUnderline, and: nil)


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
        addSubviews()
        constrainSubviews()
        
        view.layer.contents = uikitTemplate.backgroundImage.cgImage
    }
    
    // MARK: Add views to the hierarchy
    
    func addSubviews() {
        [
            logo,
            loginTextField,
            passwordTextField,
            forgotPasswordButton,
            signInButton,
            noAccountLabel,
            signUpButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    // MARK: Add up constraints
    func constrainSubviews() {
        
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coefficientLogoLoginSceneLeadingAnchor * view.frame.width),
            logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.coefficientLogoLoginSceneTrailingAnchor * view.frame.width),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coefficientLogoLoginSceneTopAnchor * view.frame.height),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: Constants.coefficientLogoLoginSceneHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coefficientLeadingAnchor * view.frame.width),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.coefficientTrailingAnchor * view.frame.width),
            loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coefficientLoginTextFieldTopAnchor * view.frame.height),
            loginTextField.heightAnchor.constraint(equalToConstant: Constants.coefficientLoginHeightAnchor * view.frame.height)
        ])

        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coefficientLeadingAnchor * view.frame.width),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.coefficientTrailingAnchor * view.frame.width),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: Constants.coefficientPasswordTextFieldTopAnchor * view.frame.height),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.coefficientLoginHeightAnchor * view.frame.height)
        ])

        NSLayoutConstraint.activate([
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coefficientLeadingAnchor * view.frame.width),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.coefficientTrailingAnchor * view.frame.width),
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.coefficientSignUpTopAnchor * view.frame.height),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: Constants.coefficientLoginHeightAnchor * view.frame.height)
        ])

        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coefficientLeadingAnchor * view.frame.width),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.coefficientTrailingAnchor * view.frame.width),
            signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: Constants.coefficientLoginHeightAnchor * view.frame.height),
            signInButton.heightAnchor.constraint(equalToConstant: Constants.coefficientLoginHeightAnchor * view.frame.height)
        ])

        NSLayoutConstraint.activate([
            noAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coefficientLeadingAnchor * view.frame.width),
            noAccountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.coefficientTrailingAnchor * view.frame.width),
            noAccountLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: Constants.coefficientSignUpTopAnchor * view.frame.height),
            noAccountLabel.heightAnchor.constraint(equalToConstant: Constants.coefficientLoginHeightAnchor * view.frame.height)
        ])

        NSLayoutConstraint.activate([
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.coefficientTrailingAnchor * view.frame.width),
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: Constants.coefficientSignUpTopAnchor * view.frame.height),
            signUpButton.heightAnchor.constraint(equalToConstant: Constants.coefficientLoginHeightAnchor * view.frame.height)
        ])
    }

    // MARK: Methods

    @objc private func loginButtonTapped() {
        
        guard let login = loginTextField.text,
              let pwd = passwordTextField.text
        else {
            self.present(alertFactory.showErrorAlert(title: "Ошибка", message: LoginMainError.zeroCaseCredentials.rawValue), animated: true, completion: nil)
            return
        }
        
        validationService.validate(login: login, and: pwd) { success, error in
            guard success
            else { 
                if let error = error {
                    self.present(self.alertFactory.showErrorAlert(title: "Ошибка", message: error.localizedDescription), animated: true, completion: nil)
                }
                return
            }

            self.loginService.login(login: login, pwd: pwd) { success, error in
                self.router.routeToTrainingScene()
            }
        }
    }

    @objc private func signUpButtonTapped() {

    }

    @objc private func forgotPasswordButtonTapped() {

    }
}
