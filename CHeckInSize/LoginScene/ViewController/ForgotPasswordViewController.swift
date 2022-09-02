//
//  ForgotPasswordViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit
import SnapKit

class ForgotPasswordViewController: UILoginViewController {

    private lazy var header: UILabel = UILabel.makeLabel(with: "Не удается войти?", labelType: .labelWithNunitoBold, size: nil)
    private lazy var instructionChangingPasswordLabel: UILabel = UILabel.makeLabel(with: "Введите свой электронный адрес, имя пользователя или номер телефона для восстановления доступа к аккаунту.", labelType: .labelWithNunito, size: nil)
//    private lazy var instructionChangingPasswordLabel: UILabel = uiComponentsFactory.makeLabel(with: "Введите свой электронный адрес, имя пользователя или номер телефона, и мы отправим вам ссылку для восстановления доступа к аккаунту.", labelType: .labelWithNunito, size: nil)
    private lazy var loginTextField: UITextField = UITextField.makeTextField(with: "Эл. адрес, телефон или имя пользователя", fieldType: .loginScreenTextField)
    private lazy var createNewAccountButton: UIButton = UIButton.makeButton(with: "Создать новый аккаунт", buttonType: .buttonWithNunitoBoldUnderline, and: createNewAccountButtonTapped)
    private lazy var getLoginLinkButton: UIButton = UIButton.makeButton(with: "СМЕНИТЬ ПАРОЛЬ", buttonType: .blackButton(cornerRadius: 20, backgroundColor: .black, titleColor: .white, size: 15), and: getLoginLinkButtonTapped)
//    private lazy var getLoginLinkButton: UIButton = uiComponentsFactory.makeButton(with: "ПОЛУЧИТЬ ССЫЛКУ ДЛЯ ВХОДА", buttonType: .blackButton, and: getLoginLinkButtonTapped)

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
            header,
            instructionChangingPasswordLabel,
            loginTextField,
            createNewAccountButton,
            getLoginLinkButton
        ].forEach {
            view.addSubview($0)
        }
    }

    // MARK: Add up constraints
    override func constrainSubviews() {
        super.constrainSubviews()
        
        header.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginHeaderTopAnchor * self.view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * self.view.frame.height)
         }
        
        instructionChangingPasswordLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginInstructionTopAnchor * self.view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginInstructionHeightAnchor * self.view.frame.height)
         }
        
        loginTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginThirdTextFieldTopAnchor * self.view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * self.view.frame.height)
         }
        
        createNewAccountButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginUnderTextFieldButtonTopAnchor * self.view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * self.view.frame.height)
         }
        
        getLoginLinkButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginMainButtonTopAnchor * self.view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * self.view.frame.height)
         }
    }
    
    
    // MARK: Actions
    
    private lazy var getLoginLinkButtonTapped = UIAction { [weak self] _ in
        
        guard let self = self
        else {
            return
        }
        guard self.loginTextField.text?.isEmpty == false
        else {
            let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: CustomError.zeroCharsLogin)
            self.present(alert, animated: true, completion: nil)
            return
        }

//        self.router.route(
//            from: self,
//            to: .oneTimePasswordViewController(login: self.loginTextField.text ?? "")
//        )
        
        self.router.route(
            from: self,
            to: .passwordCreationViewController(login: self.loginTextField.text ?? "")
        )
    }
    
    private lazy var createNewAccountButtonTapped = UIAction { [weak self] _ in
        
        guard let self = self
        else {
            return
        }

        self.router.route(
            from: self,
            to: .signupViewController
        )
    }
}
