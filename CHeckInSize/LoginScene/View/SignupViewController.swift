//
//  SignupViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class SignupViewController: UIViewController {

    private let uikitTemplate = UIKitTemplate()

    // MARK: Properties

    private let alertFactory: AlertFactory
    private let uiComponentsFactory: UIComponentsFactory
    private lazy var logoImage: UIImageView = uikitTemplate.logoImage
    private lazy var appName: UILabel = uikitTemplate.appName
    private lazy var telephoneOrAddressTextField: UITextField = uiComponentsFactory.makeTextField(with: "Моб. телефон или эл. адрес", fieldType: .loginScreenTextField)
    private lazy var fullNameTextField: UITextField = uiComponentsFactory.makeTextField(with: "Имя и фамилия", fieldType: .loginScreenTextField)
    private lazy var userNameTextField: UITextField = uiComponentsFactory.makeTextField(with: "Имя пользователя", fieldType: .loginScreenTextField)
    private lazy var passwordTextField: UITextField = uiComponentsFactory.makeTextField(with: "Пароль", fieldType: .loginScreenTextField)
    private lazy var signUpButton: UIButton = uiComponentsFactory.makeButton(with: "РЕГИСТРАЦИЯ", buttonType: .blackButton, and: nil)


    // MARK: Intialization

    init(
        alertFactory: AlertFactory,
        uiComponentsFactory: UIComponentsFactory
    ) {
        self.alertFactory = alertFactory
        self.uiComponentsFactory = uiComponentsFactory

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
            logoImage,
            appName,
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
            telephoneOrAddressTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            telephoneOrAddressTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            telephoneOrAddressTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginFirstTextFieldTopAnchor * view.frame.height),
            telephoneOrAddressTextField.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            fullNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            fullNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            fullNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginSecondTextFieldTopAnchor * view.frame.height),
            fullNameTextField.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            userNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginThirdTextFieldTopAnchor * view.frame.height),
            userNameTextField.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginFouthTextFieldTopAnchor * view.frame.height),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            signUpButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginMainButtonTopAnchor * view.frame.height),
            signUpButton.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
    }

    // MARK: Methods

    @objc private func signUpButtonTapped() {
        //
    }
}
