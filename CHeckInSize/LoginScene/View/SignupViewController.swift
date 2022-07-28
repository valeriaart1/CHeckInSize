//
//  SignupViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class SignupViewController: UILoginViewController {

//    private let uikitTemplate = UIKitTemplate()

    // MARK: Properties

//    private var validationService: ValidationService
//    private var loginService: LoginService
//    private var alertFactory: AlertFactory
//    private var uiComponentsFactory: UIComponentsFactory
//    private var router: LoginSceneRouter
//    private lazy var logoImage: UIImageView = uikitTemplate.logoImage
//    private lazy var appName: UILabel = uikitTemplate.appName
    private lazy var telephoneOrAddressTextField: UITextField = uiComponentsFactory.makeTextField(with: "Моб. телефон или эл. адрес", fieldType: .loginScreenTextField)
    private lazy var fullNameTextField: UITextField = uiComponentsFactory.makeTextField(with: "Имя и фамилия", fieldType: .loginScreenTextField)
    private lazy var userNameTextField: UITextField = uiComponentsFactory.makeTextField(with: "Имя пользователя", fieldType: .loginScreenTextField)
    private lazy var passwordTextField: UITextField = uiComponentsFactory.makeTextField(with: "Пароль", fieldType: .loginScreenTextField)
    private lazy var signUpButton: UIButton = uiComponentsFactory.makeButton(with: "ЗАРЕГИСТРИРОВАТЬСЯ", buttonType: .blackButton, and: signUpButtonTapped)


//    // MARK: Intialization
//
//    init(
//        router: LoginSceneRouter,
//        validationService: ValidationService,
//        loginService: LoginService,
//        alertFactory: AlertFactory,
//        uiComponentsFactory: UIComponentsFactory
//    ) {
//        self.validationService = validationService
//        self.loginService = loginService
//        self.alertFactory = alertFactory
//        self.router = router
//        self.uiComponentsFactory = uiComponentsFactory
//
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        constrainSubviews()
        
//        view.layer.contents = uikitTemplate.backgroundImage.cgImage
    }
    
    // MARK: Add views to the hierarchy
    
    override func addSubviews() {
        super.addSubviews()
        
        [
//            logoImage,
//            appName,
            telephoneOrAddressTextField,
            fullNameTextField,
            userNameTextField,
            passwordTextField,
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
            telephoneOrAddressTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            telephoneOrAddressTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            telephoneOrAddressTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginFirstTextFieldTopAnchor * view.frame.height),
            telephoneOrAddressTextField.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            fullNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            fullNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            fullNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginSecondTextFieldTopAnchor * view.frame.height),
            fullNameTextField.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            userNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginThirdTextFieldTopAnchor * view.frame.height),
            userNameTextField.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginFouthTextFieldTopAnchor * view.frame.height),
            passwordTextField.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            signUpButton.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginMainButtonTopAnchor * view.frame.height),
            signUpButton.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
    }
    
//    func updateOptionsViewController (
//        alertFactory: AlertFactory,
//        uiComponentsFactory: UIComponentsFactory
//    ) {
//        self.alertFactory = alertFactory
//        self.uiComponentsFactory = uiComponentsFactory
//    }

    // MARK: Actions
    
    private lazy var signUpButtonTapped = UIAction { [weak self] _ in
        print("")
    }
}
