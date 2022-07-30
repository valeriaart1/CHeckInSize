//
//  SignupViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class SignupViewController: UILoginViewController {

    // MARK: Properties
    private lazy var telephoneOrAddressTextField: UITextField = uiComponentsFactory.makeTextField(with: "Моб. телефон или эл. адрес", fieldType: .loginScreenTextField)
    private lazy var fullNameTextField: UITextField = uiComponentsFactory.makeTextField(with: "Имя и фамилия", fieldType: .loginScreenTextField)
    private lazy var userNameTextField: UITextField = uiComponentsFactory.makeTextField(with: "Имя пользователя", fieldType: .loginScreenTextField)
    private lazy var passwordTextField: UITextField = uiComponentsFactory.makeTextField(with: "Пароль", fieldType: .loginScreenTextField)
    private lazy var signUpButton: UIButton = uiComponentsFactory.makeButton(with: "ЗАРЕГИСТРИРОВАТЬСЯ", buttonType: .blackButton, and: signUpButtonTapped)
    
    
    // MARK: Intialization

    typealias DI = ViewContorllerFactory.Dependency

    init(with container: DI) {
        super.init(
            router: container.router,
            validationService: container.validationService,
            loginService: container.loginService,
            alertFactory: container.alertFactory,
            uiComponentsFactory: container.uiComponentsFactory
        )
    }

    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        constrainSubviews()
    }
    
    // MARK: Add views to the hierarchy
    
    override func addSubviews() {
        super.addSubviews()
        
        [
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

    // MARK: Actions
    
    private lazy var signUpButtonTapped = UIAction { [weak self] _ in
        
        guard let self = self
        else {
            return
        }

        self.router.route(
            from: self,
            to: .loginMainViewController,
            navigationType: .presentViewController
        )
    }
}
