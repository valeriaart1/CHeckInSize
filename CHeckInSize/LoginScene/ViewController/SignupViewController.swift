//
//  SignupViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit
import SnapKit

class SignupViewController: UILoginViewController {
    
    private lazy var userLoginTextField: UITextField = UITextField.makeTextField(with: "Моб. телефон или эл. адрес", fieldType: .loginScreenTextField)
    private lazy var fullNameTextField: UITextField = UITextField.makeTextField(with: "Имя и фамилия", fieldType: .loginScreenTextField)
    private lazy var userNameTextField: UITextField = UITextField.makeTextField(with: "Имя пользователя", fieldType: .loginScreenTextField)
    private lazy var passwordTextField: UITextField = UITextField.makeTextField(with: "Пароль", fieldType: .loginScreenTextField)
    private lazy var signUpButton: UIButton = UIButton.makeButton(with: "ЗАРЕГИСТРИРОВАТЬСЯ", buttonType: .blackButton(cornerRadius: 20, backgroundColor: .black, titleColor: .white, size: 15), and: signUpButtonTapped)

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
        addSubviews()
        constrainSubviews()
    }
    
    // MARK: Add views to the hierarchy
    
    override func addSubviews() {
        super.addSubviews()
        
        [
            userLoginTextField,
            fullNameTextField,
            userNameTextField,
            passwordTextField,
            signUpButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: Add up constraints
    override func constrainSubviews() {
        super.constrainSubviews()
        
        userLoginTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginFirstTextFieldTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
         }
        
        fullNameTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginSecondTextFieldTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
         }
        
        userNameTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginThirdTextFieldTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
         }
        
        passwordTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginFouthTextFieldTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
         }
        
        signUpButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginMainButtonTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
         }
    }

    // MARK: Actions
    
    private lazy var signUpButtonTapped = UIAction { [weak self] _ in
        
        self?.validationService.validateSignup(userLogin: self?.userLoginTextField.text, userName: self?.userNameTextField.text, userPassword: self?.passwordTextField.text) { success, error in
            guard success
            else {
                if let error = error {
                   let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: error)
                    self?.present(alert, animated: true, completion: nil)
                }
                return
            }
                
            self?.validationService.validatePassword(password: (self?.passwordTextField.text)!) { success, error in
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
                
                let user = UserAccount(login: self.userLoginTextField.text!, fullname: self.fullNameTextField.text, userName: self.userNameTextField.text!, password: self.passwordTextField.text!)

                self.firebaseServiceUserAccount.setUser(user: user) {success, error in
                    guard success
                    else {
                        if let error = error {
                           let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: error)
                            self.present(alert, animated: true, completion: nil)
                        }
                        return
                    }
                    
                }
                
                self.router.route(
                    from: self,
                    to: .loginMainViewController,
                    navigationType: .presentViewController
                )
            }
        }
    }
}
