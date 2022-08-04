//
//  ForgotPasswordViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class ForgotPasswordViewController: UILoginViewController {

    // MARK: Properties

    private lazy var header: UILabel = uiComponentsFactory.makeLabel(with: "Не удается войти?", labelType: .labelWithNunitoBold, size: nil)
    private lazy var instructionChangingPasswordLabel: UILabel = uiComponentsFactory.makeLabel(with: "Введите свой электронный адрес, имя пользователя или номер телефона, и мы отправим вам ссылку для восстановления доступа к аккаунту.", labelType: .labelWithNunito, size: nil)
    private lazy var loginTextField: UITextField = uiComponentsFactory.makeTextField(with: "Эл. адрес, телефон или имя пользователя", fieldType: .loginScreenTextField)
    private lazy var createNewAccountButton: UIButton = uiComponentsFactory.makeButton(with: "Создать новый аккаунт", buttonType: .buttonWithNunitoBoldUnderline, and: createNewAccountButtonTapped)
    private lazy var getLoginLinkButton: UIButton = uiComponentsFactory.makeButton(with: "ПОЛУЧИТЬ ССЫЛКУ ДЛЯ ВХОДА", buttonType: .blackButton, and: getLoginLinkButtonTapped)
    
    
    // MARK: Intialization

    typealias DI = ViewContorllerFactory.LoginDependency

    init(with container: DI) {
        super.init(
            router: container.router,
            validationService: container.validationService,
            loginService: container.loginService,
            firebaseService: container.firebaseService,
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
            header,
            instructionChangingPasswordLabel,
            loginTextField,
            createNewAccountButton,
            getLoginLinkButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }

    // MARK: Add up constraints
    override func constrainSubviews() {
        super.constrainSubviews()
        
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            header.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            header.topAnchor.constraint(equalTo: self.view.topAnchor, constant: LoginConstantsAnchor.coeffLoginHeaderTopAnchor * self.view.frame.height),
            header.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * self.view.frame.height)
        ])

        NSLayoutConstraint.activate([
            instructionChangingPasswordLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            instructionChangingPasswordLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            instructionChangingPasswordLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: LoginConstantsAnchor.coeffLoginInstructionTopAnchor * self.view.frame.height),
            instructionChangingPasswordLabel.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginInstructionHeightAnchor * self.view.frame.height)
        ])

        NSLayoutConstraint.activate([
            loginTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            loginTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            loginTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: LoginConstantsAnchor.coeffLoginThirdTextFieldTopAnchor * self.view.frame.height),
            loginTextField.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * self.view.frame.height)
        ])

        NSLayoutConstraint.activate([
            createNewAccountButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            createNewAccountButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            createNewAccountButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: LoginConstantsAnchor.coeffLoginUnderTextFieldButtonTopAnchor * self.view.frame.height),
            createNewAccountButton.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * self.view.frame.height)
        ])

        NSLayoutConstraint.activate([
            getLoginLinkButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            getLoginLinkButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -LoginConstantsAnchor.coeffLeadingTrailingAnchor * self.view.frame.width),
            getLoginLinkButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: LoginConstantsAnchor.coeffLoginMainButtonTopAnchor * self.view.frame.height),
            getLoginLinkButton.heightAnchor.constraint(equalToConstant: LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * self.view.frame.height)
        ])
    }
    
    
    // MARK: Actions
    
    private lazy var getLoginLinkButtonTapped = UIAction { [weak self] _ in
        
        guard let self = self
        else {
            return
        }
        guard self.loginTextField.text?.isEmpty == false
        else {
            let alert = self.alertFactory.showAlert(title: "Ошибка", alertType: .errorAlert, message: CustomError.zeroCharsLogin)
            self.present(alert, animated: true, completion: nil)
            return
        }

        self.router.route(
            from: self,
            to: .oneTimePasswordViewController(login: self.loginTextField.text ?? "")
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
