//
//  PasswordCreationView.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 23.08.22.
//

import UIKit
import SnapKit

class PasswordCreationView: UILoginViewController {

    var login: String
    
    private lazy var header: UILabel = UILabel.makeLabel(with: "Cоздание надежного пароля", labelType: .labelWithNunitoBold, size: nil)
    private lazy var instructionCreatingPasswordLabel: UILabel = UILabel.makeLabel(with: "Пароль должен содержать не менее 8 символов, включая цифры, буквы и специальные символы (!$@%)", labelType: .labelWithNunito, size: nil)
    private lazy var newPasswordTextField: UITextField = UITextField.makeTextField(with: "Новый пароль", fieldType: .loginScreenTextField)
    private lazy var repeatNewPasswordTextField: UITextField = UITextField.makeTextField(with: "Введите новый пароль ещё раз", fieldType: .loginScreenTextField)
    private lazy var resetPasswordButton: UIButton = UIButton.makeButton(with: "СБРОСИТЬ ПАРОЛЬ", buttonType: .blackButton(cornerRadius: 20, backgroundColor: .black, titleColor: .white, size: 15), and: resetPasswordButtonTapped)

    typealias DI = ViewControllerFactory.LoginDependency

    init(with container: DI,
         login: String) {
        self.login = login
        
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
            header,
            instructionCreatingPasswordLabel,
            newPasswordTextField,
            repeatNewPasswordTextField,
            resetPasswordButton
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
        
        instructionCreatingPasswordLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginInstructionTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginInstructionHeightAnchor * view.frame.height)
         }
        
        newPasswordTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginThirdTextFieldTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
         }
        
        repeatNewPasswordTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginFouthTextFieldTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
         }
        
        repeatNewPasswordTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginMainButtonTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
         }
    }

    // MARK: Actions
    
    private lazy var resetPasswordButtonTapped = UIAction { [weak self] _ in
        guard self?.newPasswordTextField.text?.isEmpty == false else {
            let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: CustomError.zeroCharsPassword)
            self?.present(alert, animated: true, completion: nil)
            
            return
        }
        
        self?.validationService.validatePassword(password: (self?.newPasswordTextField.text)!) { success, error in
            guard success
            else {
                if let error = error {
                   let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: error)
                    self?.present(alert, animated: true, completion: nil)
                }
                return
            }
            
            self?.validationService.validatePasswordMatch(password: (self?.newPasswordTextField.text)!, repeatPassword: self?.repeatNewPasswordTextField.text) { success, error in
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
                
                self.firebaseServiceUserAccount.updatePassword(login: self.login, password: self.newPasswordTextField.text!) { success, error in
                    guard success
                    else {
                        if let error = error {
                            let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: error)
                            self.present(alert, animated: true, completion: nil)
                        }
                        return
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
}
