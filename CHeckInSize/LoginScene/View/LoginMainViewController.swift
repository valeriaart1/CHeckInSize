//
//  LoginMainViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class LoginMainViewController: UILoginViewController {

    // MARK: Properties

    private lazy var header: UILabel = uiComponentsFactory.makeLabel(with: "Вход в CHeckInSize", labelType: .labelWithNunitoBold, size: nil)
    private lazy var loginTextField: UITextField = uiComponentsFactory.makeTextField(with: "Номер телефона, эл. адрес или имя пользователя", fieldType: .loginScreenTextField)
    private lazy var passwordTextField: UITextField = uiComponentsFactory.makeTextField(with: "Пароль", fieldType: .loginScreenTextField)
    private lazy var forgotPasswordButton: UIButton = uiComponentsFactory.makeButton(with: "Забыли пароль?", buttonType: .buttonWithNunitoBoldUnderline, and: forgotPasswordButtonTapped)
    private lazy var signInButton: UIButton = uiComponentsFactory.makeButton(with: "ВОЙТИ", buttonType: .blackButton(cornerRadius: 20, backgroundColor: .black, titleColor: .white, size: 15), and: loginButtonTapped)
    private lazy var noAccountLabel: UILabel = uiComponentsFactory.makeLabel(with: "Еще нет аккаунта?", labelType: .labelWithNunito, size: nil, textAligment: .left)
    private lazy var signUpButton: UIButton = uiComponentsFactory.makeButton(with: "Зарегистрируйтесь", buttonType: .buttonWithNunitoBoldUnderline, and: signUpButtonTapped, contentAligment: .right)
    
    
    // MARK: Intialization

    typealias DI = ViewContorllerFactory.LoginDependency

    init(with container: DI) {
        super.init(
            router: container.router,
            validationService: container.validationService,
            loginService: container.loginService,
            firebaseServiceUserAccount: container.firebaseServiceUserAccount,
            alertFactory: container.alertFactory,
            uiComponentsFactory: container.uiComponentsFactory
        )
    }

    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let login = KeychainWrapper(serviceName: Constants.dataModelName).string(forKey: Constants.strLoginKey),
           let password = KeychainWrapper(serviceName: Constants.dataModelName).string(forKey: Constants.strPasswordKey) {
            loginTextField.text = login
            passwordTextField.text = password
        }
        
        addSubviews()
        constrainSubviews()
    }
    
    // MARK: Add views to the hierarchy
    
    override func addSubviews() {
        super.addSubviews()
        
        [
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
        
        self?.validationService.validateLogin(login: login, and: pwd) { success, error in
            guard success
            else {
                if let error = error,
                   let alert = self?.alertFactory.showAlert(title: "Ошибка", alertType: .errorAlert, message: error) {
                    self?.present(alert, animated: true, completion: nil)
                }
                return
            }

            self?.loginService.login(login: login, pwd: pwd) { success, error in
                guard success
                else {
                    if let error = error,
                       let alert = self?.alertFactory.showAlert(title: "Ошибка", alertType: .errorAlert, message: error){
                        self?.present(alert, animated: true, completion: nil)
                    }
                    return
                }
                
                guard let self = self
                else {
                    return
                }
                
                KeyChainWrapperService().keyChain(login: login, password: pwd)
                
                self.router.route (
                   from: self,
                   to: .trainingMainViewController,
                   navigationType: .presentViewController
                )
            }
        }
    }
    
    private lazy var signUpButtonTapped = UIAction { [weak self] _ in
        
        guard let self = self
        else {
            return
        }

        self.router.route(
            from: self,
            to: .signupViewController
        )
    }
    
    private lazy var forgotPasswordButtonTapped = UIAction { [weak self] _ in

        guard let self = self
        else {
            return
        }

        self.router.route(
            from: self,
            to: .forgotPasswordViewController
        )
    }
}
