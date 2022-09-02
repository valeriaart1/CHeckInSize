//
//  LoginMainViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit
import SwiftKeychainWrapper
import SnapKit

class LoginMainViewController: UILoginViewController {

    private lazy var header: UILabel = UILabel.makeLabel(with: "Вход в CHeckInSize", labelType: .labelWithNunitoBold, size: nil)
    private lazy var loginTextField: UITextField = UITextField.makeTextField(with: "Номер телефона, эл. адрес или имя пользователя", fieldType: .loginScreenTextField)
    private lazy var passwordTextField: UITextField = UITextField.makeTextField(with: "Пароль", fieldType: .loginScreenTextField)
    private lazy var forgotPasswordButton: UIButton = UIButton.makeButton(with: "Забыли пароль?", buttonType: .buttonWithNunitoBoldUnderline, and: forgotPasswordButtonTapped)
    private lazy var signInButton: UIButton = UIButton.makeButton(with: "ВОЙТИ", buttonType: .blackButton(cornerRadius: 20, backgroundColor: .black, titleColor: .white, size: 15), and: loginButtonTapped)
    private lazy var noAccountLabel: UILabel = UILabel.makeLabel(with: "Еще нет аккаунта?", labelType: .labelWithNunito, size: nil, textAligment: .left)
    private lazy var signUpButton: UIButton = UIButton.makeButton(with: "Зарегистрируйтесь", buttonType: .buttonWithNunitoBoldUnderline, and: signUpButtonTapped, contentAligment: .right)


    typealias DI = ViewControllerFactory.LoginDependency

    init(with container: DI) {
        super.init(
            router: container.router,
            validationService: container.validationService,
            loginService: container.loginService,
            firebaseServiceUserAccount: container.firebaseServiceUserAccount
        )
    }

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
            view.addSubview($0)
        }
    }
    
    // MARK: Add up constraints
    override func constrainSubviews() {
        super.constrainSubviews()
        
        header.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginHeaderTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
         }
        
        loginTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginSecondTextFieldTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
         }
        
        passwordTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginThirdTextFieldTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        }
        
        forgotPasswordButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginUnderTextFieldButtonTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        }
        
        signInButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginMainButtonTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        }
        
        noAccountLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginUnderButtonTopAnchor * view.frame.height)
            make.width.equalTo(LoginConstantsAnchor.coeffLoginUnderButtonWidthAnchor * view.frame.width)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        }
        
        signUpButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginUnderButtonTopAnchor * view.frame.height)
            make.width.equalTo(LoginConstantsAnchor.coeffLoginUnderButtonWidthAnchor * view.frame.width)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        }
    }

    // MARK: Actions
    
    private lazy var loginButtonTapped = UIAction { [weak self] _ in
        guard let login = self?.loginTextField.text,
              let pwd = self?.passwordTextField.text
              
        else {
            let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: CustomError.zeroCaseCredentials)
            self?.present(alert, animated: true, completion: nil)
            
            return
        }
        
        self?.validationService.validateLogin(login: login, and: pwd) { success, error in
            guard success
            else {
                if let error = error {
                   let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: error)
                    self?.present(alert, animated: true, completion: nil)
                }
                return
            }

            self?.loginService.login(login: login, pwd: pwd) { success, error in
                guard success
                else {
                    if let error = error {
                       let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: error)
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
