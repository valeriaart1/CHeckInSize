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
    private let uiComponentsFactory: UIComponentsFactory
    private let router: LoginSceneRouter
    private lazy var logoImage: UIImageView = uikitTemplate.logoImage
    private lazy var appName: UILabel = uikitTemplate.appName
    private lazy var header: UILabel = uiComponentsFactory.makeLabel(with: "Вход в CHeckInSize", labelType: .labelWithNunitoBold, size: nil, textAligment: nil)
    private lazy var loginTextField: UITextField = uiComponentsFactory.makeTextField(with: "Номер телефона, эл. адрес или имя пользователя", fieldType: .loginScreenTextField)
    private lazy var passwordTextField: UITextField = uiComponentsFactory.makeTextField(with: "Пароль", fieldType: .loginScreenTextField)
    private lazy var forgotPasswordButton: UIButton = uiComponentsFactory.makeButton(with: "Забыли пароль?", buttonType: .buttonWithNunitoBoldUnderline, and: forgotPasswordButtonTapped, contentAligment: nil)
    private lazy var signInButton: UIButton = uiComponentsFactory.makeButton(with: "ВОЙТИ", buttonType: .blackButton, and: loginButtonTapped, contentAligment: nil)
    private lazy var noAccountLabel: UILabel = uiComponentsFactory.makeLabel(with: "Еще нет аккаунта?", labelType: .labelWithNunito, size: nil, textAligment: .left)
    private lazy var signUpButton: UIButton = uiComponentsFactory.makeButton(with: "Зарегистрируйтесь", buttonType: .buttonWithNunitoBoldUnderline, and: signUpButtonTapped, contentAligment: .right)


    // MARK: Intialization

    init(
        router: LoginSceneRouter,
        validationService: ValidationService,
        loginService: LoginService,
        alertFactory: AlertFactory,
        uiComponentsFactory: UIComponentsFactory
    ) {
        self.validationService = validationService
        self.loginService = loginService
        self.alertFactory = alertFactory
        self.router = router
        self.uiComponentsFactory = uiComponentsFactory

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Life Cycle

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        constrainSubviews()
        
        view.layer.contents = uikitTemplate.backgroundImage.cgImage
    }
    
    // MARK: Add views to the hierarchy
    
    func addSubviews() {
        [
            logoImage,
            appName,
            header,
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
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginLogoTopAnchor * view.frame.height),
            logoImage.widthAnchor.constraint(equalToConstant: Constants.coeffLoginLogoImageWidthAnchor * view.frame.width),
            logoImage.heightAnchor.constraint(equalToConstant: Constants.coeffLogoHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            appName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            appName.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginLogoTopAnchor * view.frame.height),
            appName.widthAnchor.constraint(equalToConstant: Constants.coeffLoginAppNameWidthAnchor * view.frame.width),
            appName.heightAnchor.constraint(equalToConstant: Constants.coeffLogoHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginHeaderTopAnchor * view.frame.height),
            header.heightAnchor.constraint(equalToConstant: Constants.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginSecondTextFieldTopAnchor * view.frame.height),
            loginTextField.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginThirdTextFieldTopAnchor * view.frame.height),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            forgotPasswordButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginUnderTextFieldButtonTopAnchor * view.frame.height),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: Constants.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            signInButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginMainButtonTopAnchor * view.frame.height),
            signInButton.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            noAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            noAccountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginUnderButtonTopAnchor * view.frame.height),
            noAccountLabel.widthAnchor.constraint(equalToConstant: Constants.coeffLoginUnderButtonWidthAnchor * view.frame.width),
            noAccountLabel.heightAnchor.constraint(equalToConstant: Constants.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            signUpButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginUnderButtonTopAnchor * view.frame.height),
            signUpButton.widthAnchor.constraint(equalToConstant: Constants.coeffLoginUnderButtonWidthAnchor * view.frame.width),
            signUpButton.heightAnchor.constraint(equalToConstant: Constants.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        ])
    }

    // MARK: Actions
    
    private lazy var loginButtonTapped = UIAction { [weak self] _ in
        guard let login = self?.loginTextField.text,
              let pwd = self?.passwordTextField.text
              
        else {
            if let alert = self?.alertFactory.showErrorAlert(title: "Ошибка", message: ValidationError.zeroCaseCredentials.rawValue) {
                self?.present(alert, animated: true, completion: nil)
            }
            return
        }
        
        self?.validationService.validate(login: login, and: pwd) { success, error in
            guard success
            else { 
                if let error = error,
                    let alert = self?.alertFactory.showErrorAlert(title: "Ошибка", message: error.localizedDescription) {
                    self?.present(alert, animated: true, completion: nil)
                }
                return
            }

            self?.loginService.login(login: login, pwd: pwd) { success, error in
                guard success
                else {
                    if let error = error,
                        let alert = self?.alertFactory.showErrorAlert(title: "Ошибка", message: error.localizedDescription){
                        self?.present(alert, animated: true, completion: nil)
                    }
                    return
                }
//                self?.router.routingBetweenScenes(from: self ?? UIViewController(), to: <#T##UIViewController#>, presentStyle: <#T##UIModalPresentationStyle#>, transStyle: <#T##UIModalTransitionStyle#>)
            }
        }
    }
    
    private lazy var signUpButtonTapped = UIAction { [weak self] _ in
        self?.router.routingBetweenScenes(from: self ?? UIViewController(), to: LoginSceneBuilder().makeLoginSceneViewController(viewControllerName: .SignupViewController, router: LoginSceneRouter(), validationService: ValidationService(), loginService: LoginService()), presentStyle: .fullScreen, transStyle: .crossDissolve)
    }
    
    private lazy var forgotPasswordButtonTapped = UIAction { [weak self] _ in
        self?.router.routingBetweenScenes(
            from: self ?? UIViewController(),
            to: LoginSceneBuilder().makeLoginSceneViewController(viewControllerName: .ForgotPasswordViewController, router: LoginSceneRouter(), validationService: ValidationService(), loginService: LoginService()), presentStyle: .fullScreen, transStyle: .crossDissolve)
    }
}
