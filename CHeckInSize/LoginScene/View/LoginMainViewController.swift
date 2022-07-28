//
//  LoginMainViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class LoginMainViewController: UILoginViewController {
    
//    private let uikitTemplate = UIKitTemplate()

    // MARK: Properties

//    private var validationService: ValidationService
//    private var loginService: LoginService
//    private var alertFactory: AlertFactory
//    private var uiComponentsFactory: UIComponentsFactory
//    private var router: LoginSceneRouter
//    private lazy var logoImage: UIImageView = uikitTemplate.logoImage
//    private lazy var appName: UILabel = uikitTemplate.appName
    private lazy var header: UILabel = uiComponentsFactory.makeLabel(with: "Вход в CHeckInSize", labelType: .labelWithNunitoBold, size: nil)
    private lazy var loginTextField: UITextField = uiComponentsFactory.makeTextField(with: "Номер телефона, эл. адрес или имя пользователя", fieldType: .loginScreenTextField)
    private lazy var passwordTextField: UITextField = uiComponentsFactory.makeTextField(with: "Пароль", fieldType: .loginScreenTextField)
    private lazy var forgotPasswordButton: UIButton = uiComponentsFactory.makeButton(with: "Забыли пароль?", buttonType: .buttonWithNunitoBoldUnderline, and: forgotPasswordButtonTapped)
    private lazy var signInButton: UIButton = uiComponentsFactory.makeButton(with: "ВОЙТИ", buttonType: .blackButton, and: loginButtonTapped)
    private lazy var noAccountLabel: UILabel = uiComponentsFactory.makeLabel(with: "Еще нет аккаунта?", labelType: .labelWithNunito, size: nil, textAligment: .left)
    private lazy var signUpButton: UIButton = uiComponentsFactory.makeButton(with: "Зарегистрируйтесь", buttonType: .buttonWithNunitoBoldUnderline, and: signUpButtonTapped, contentAligment: .right)


//    // MARK: Intialization
//
//    override init(
//        router: LoginSceneRouter,
//        validationService: ValidationService,
//        loginService: LoginService,
//        alertFactory: AlertFactory,
//        uiComponentsFactory: UIComponentsFactory
//    ) {
//        super.init(
//            router: router,
//            validationService: validationService,
//            loginService: loginService,
//            alertFactory: alertFactory,
//            uiComponentsFactory: uiComponentsFactory
//        )
////        self.validationService = validationService
////        self.loginService = loginService
////        self.alertFactory = alertFactory
////        self.router = router
////        self.uiComponentsFactory = uiComponentsFactory
////
////        super.init(nibName: nil, bundle: nil)
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    // MARK: View Life Cycle

//    override func loadView() {
//        super.loadView()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        constrainSubviews()
        
//        view.layer.contents = uikitTemplate.backgroundImage.cgImage
    }

    typealias DI = ViewContorllerFatory.Dependency

    init(with container: DI) {
        super.init(
            router: container.router,
            validationService: container.validationService,
            loginService: container.loginService,
            alertFactory: container.alertFactory,
            uiComponentsFactory: container.uiComponentsFactory
        )
    }
    
    // MARK: Add views to the hierarchy
    
    override func addSubviews() {
        super.addSubviews()
        
        [
//            logoImage,
//            appName,
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
    override func constrainSubviews() {
        super.constrainSubviews()
        
//        NSLayoutConstraint.activate([
//            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
//            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginLogoTopAnchor * view.frame.height),
//            logoImage.widthAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginLogoImageWidthAnchor * view.frame.width),
//            logoImage.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLogoHeightAnchor * view.frame.height)
//        ])
//
//        NSLayoutConstraint.activate([
//            appName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
//            appName.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginLogoTopAnchor * view.frame.height),
//            appName.widthAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginAppNameWidthAnchor * view.frame.width),
//            appName.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLogoHeightAnchor * view.frame.height)
//        ])
        
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginHeaderTopAnchor * view.frame.height),
            header.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginSecondTextFieldTopAnchor * view.frame.height),
            loginTextField.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginThirdTextFieldTopAnchor * view.frame.height),
            passwordTextField.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            forgotPasswordButton.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginUnderTextFieldButtonTopAnchor * view.frame.height),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            signInButton.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginMainButtonTopAnchor * view.frame.height),
            signInButton.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            noAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            noAccountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginUnderButtonTopAnchor * view.frame.height),
            noAccountLabel.widthAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginUnderButtonWidthAnchor * view.frame.width),
            noAccountLabel.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            signUpButton.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginUnderButtonTopAnchor * view.frame.height),
            signUpButton.widthAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginUnderButtonWidthAnchor * view.frame.width),
            signUpButton.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        ])
    }
    
//    func updateOptionsViewController (
//        router: LoginSceneRouter,
//        validationService: ValidationService,
//        loginService: LoginService,
//        alertFactory: AlertFactory,
//        uiComponentsFactory: UIComponentsFactory
//    ) {
//        self.router = router
//        self.validationService = validationService
//        self.loginService = loginService
//        self.alertFactory = alertFactory
//        self.uiComponentsFactory = uiComponentsFactory
//    }

    // MARK: Actions
    
    private lazy var loginButtonTapped = UIAction { [weak self] _ in
        guard let login = self?.loginTextField.text,
              let pwd = self?.passwordTextField.text
              
        else {
            if let alert = self?.alertFactory.showAlert(title: "Ошибка", alertType: .errorAlert, message: CustomError.zeroCaseCredentials) {
                self?.present(alert, animated: true, completion: nil)
            }
            return
        }
        
        self?.validationService.validate(login: login, and: pwd) { success, error in
            guard success
            else {
                if let error = error,
                   let alert = self?.alertFactory.showAlert(title: "Ошибка", alertType: .errorAlert, message: error as! CustomError) {
                    self?.present(alert, animated: true, completion: nil)
                }
                return
            }

            self?.loginService.login(login: login, pwd: pwd) { success, error in
                guard success
                else {
                    if let error = error,
                       let alert = self?.alertFactory.showAlert(title: "Ошибка", alertType: .errorAlert, message: error as! CustomError){
                        self?.present(alert, animated: true, completion: nil)
                    }
                    return
                }
//                self?.router.routingBetweenScenes(from: self, to: .trainingMainViewController, router: self?.router, validationService: self?.validationService, loginService: self?.loginService, alertFactory: self?.alertFactory, uiComponentsFactory: self?.uiComponentsFactory)
            }
        }
    }
    
    private lazy var signUpButtonTapped = UIAction { [weak self] _ in
//        self?.router.routingBetweenScenes(from: self, to: .signupViewController, router: self?.router, validationService: self?.validationService, loginService: self?.loginService, alertFactory: self?.alertFactory, uiComponentsFactory: self?.uiComponentsFactory)
    }
    
    private lazy var forgotPasswordButtonTapped = UIAction { [weak self] _ in
//        self?.router.routingBetweenScenes(
//            from: self,
//            to: .forgotPasswordViewController,
//            router: self?.router,
//            validationService: self?.validationService,
//            loginService: self?.loginService,
//            alertFactory: self?.alertFactory,
//            uiComponentsFactory: self?.uiComponentsFactory
//        )

        guard let self = self
        else {
            return
        }

        self.router.route(
            from: self,
            to: .forgotPasswordViewController,
            presentStyle: .automatic,
            transitionStyle: .crossDissolve
        )
    }
}
