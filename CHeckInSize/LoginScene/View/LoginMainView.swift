//
//  LoginMainView.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 23.08.22.
//

import UIKit
import SwiftKeychainWrapper
import SnapKit

class LoginMainView: UILoginView {
    
    private lazy var header: UILabel = UILabel.makeLabel(with: "Вход в CHeckInSize", labelType: .labelWithNunitoBold, size: nil)
    private lazy var loginTextField: UITextField = UITextField.makeTextField(with: "Номер телефона, эл. адрес или имя пользователя", fieldType: .loginScreenTextField)
    private lazy var passwordTextField: UITextField = UITextField.makeTextField(with: "Пароль", fieldType: .loginScreenTextField)
    private lazy var forgotPasswordButton: UIButton = UIButton.makeButton(with: "Забыли пароль?", buttonType: .buttonWithNunitoBoldUnderline)
    private lazy var signInButton: UIButton = UIButton.makeButton(with: "ВОЙТИ", buttonType: .blackButton(cornerRadius: 20, backgroundColor: .black, titleColor: .white, size: 15))
    private lazy var noAccountLabel: UILabel = UILabel.makeLabel(with: "Еще нет аккаунта?", labelType: .labelWithNunito, size: nil, textAligment: .left)
    private lazy var signUpButton: UIButton = UIButton.makeButton(with: "Зарегистрируйтесь", buttonType: .buttonWithNunitoBoldUnderline, contentAligment: .right)


    typealias DI = ViewControllerFactory.LoginDependency

    override init() {
        
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
            addSubview($0)
        }
    }
    
    // MARK: Add up constraints
    override func constrainSubviews() {
        super.constrainSubviews()
        
        header.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.trailing.equalToSuperview().offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.top.equalToSuperview().offset(LoginConstantsAnchor.coeffLoginHeaderTopAnchor * self.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * self.frame.height)
         }
        
        loginTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.trailing.equalToSuperview().offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.top.equalToSuperview().offset(LoginConstantsAnchor.coeffLoginSecondTextFieldTopAnchor * self.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * self.frame.height)
         }
        
        passwordTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.trailing.equalToSuperview().offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.top.equalToSuperview().offset(LoginConstantsAnchor.coeffLoginThirdTextFieldTopAnchor * self.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * self.frame.height)
        }
        
        forgotPasswordButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.trailing.equalToSuperview().offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.top.equalToSuperview().offset(LoginConstantsAnchor.coeffLoginUnderTextFieldButtonTopAnchor * self.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * self.frame.height)
        }
        
        signInButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.trailing.equalToSuperview().offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.top.equalToSuperview().offset(LoginConstantsAnchor.coeffLoginMainButtonTopAnchor * self.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * self.frame.height)
        }
        
        noAccountLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.top.equalToSuperview().offset(LoginConstantsAnchor.coeffLoginUnderButtonTopAnchor * self.frame.height)
            make.width.equalTo(LoginConstantsAnchor.coeffLoginUnderButtonWidthAnchor * self.frame.width)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * self.frame.height)
        }
        
        signUpButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalToSuperview().offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.frame.width)
            make.top.equalToSuperview().offset(LoginConstantsAnchor.coeffLoginUnderButtonTopAnchor * self.frame.height)
            make.width.equalTo(LoginConstantsAnchor.coeffLoginUnderButtonWidthAnchor * self.frame.width)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * self.frame.height)
        }
    }
}
