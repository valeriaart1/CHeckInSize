//
//  PasswordCreationViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class PasswordCreationViewController: UILoginViewController {

//    private let uikitTemplate = UIKitTemplate()

    // MARK: Properties

//    private var validationService: ValidationService
//    private var loginService: LoginService
//    private var alertFactory: AlertFactory
//    private var uiComponentsFactory: UIComponentsFactory
//    private var router: LoginSceneRouter
//    private lazy var logoImage: UIImageView = uikitTemplate.logoImage
//    private lazy var appName: UILabel = uikitTemplate.appName
    private lazy var header: UILabel = uiComponentsFactory.makeLabel(with: "Cоздание надежного пароля", labelType: .labelWithNunitoBold, size: nil)
    private lazy var instructionCreatingPasswordLabel: UILabel = uiComponentsFactory.makeLabel(with: "Пароль должен содержать не менее 6 символов, включая цифры, буквы и специальные символы (!$@%)", labelType: .labelWithNunito, size: nil)
    private lazy var newPasswordTextField: UITextField = uiComponentsFactory.makeTextField(with: "Новый пароль", fieldType: .loginScreenTextField)
    private lazy var repeatNewPasswordTextField: UITextField = uiComponentsFactory.makeTextField(with: "Введите новый пароль ещё раз", fieldType: .loginScreenTextField)
    private lazy var resetPasswordButton: UIButton = uiComponentsFactory.makeButton(with: "СБРОСИТЬ ПАРОЛЬ", buttonType: .blackButton, and: getLoginLinkButtonTapped)


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
            header,
            instructionCreatingPasswordLabel,
            newPasswordTextField,
            repeatNewPasswordTextField,
            resetPasswordButton
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
            instructionCreatingPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            instructionCreatingPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            instructionCreatingPasswordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginInstructionTopAnchor * view.frame.height),
            instructionCreatingPasswordLabel.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginInstructionHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            newPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            newPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            newPasswordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginThirdTextFieldTopAnchor * view.frame.height),
            newPasswordTextField.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            repeatNewPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            repeatNewPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            repeatNewPasswordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginFouthTextFieldTopAnchor * view.frame.height),
            repeatNewPasswordTextField.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            resetPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            resetPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width),
            resetPasswordButton.topAnchor.constraint(equalTo: view.topAnchor, constant: LoginConstantsAnchor.coeffLoginMainButtonTopAnchor * view.frame.height),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
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
    
    private lazy var getLoginLinkButtonTapped = UIAction { [weak self] _ in
        print("")
    }
}
