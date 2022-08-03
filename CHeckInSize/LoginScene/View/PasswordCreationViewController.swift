//
//  PasswordCreationViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class PasswordCreationViewController: UILoginViewController {

    // MARK: Properties
    private lazy var header: UILabel = uiComponentsFactory.makeLabel(with: "Cоздание надежного пароля", labelType: .labelWithNunitoBold, size: nil)
    private lazy var instructionCreatingPasswordLabel: UILabel = uiComponentsFactory.makeLabel(with: "Пароль должен содержать не менее 8 символов, включая цифры, буквы и специальные символы (!$@%)", labelType: .labelWithNunito, size: nil)
    private lazy var newPasswordTextField: UITextField = uiComponentsFactory.makeTextField(with: "Новый пароль", fieldType: .loginScreenTextField)
    private lazy var repeatNewPasswordTextField: UITextField = uiComponentsFactory.makeTextField(with: "Введите новый пароль ещё раз", fieldType: .loginScreenTextField)
    private lazy var resetPasswordButton: UIButton = uiComponentsFactory.makeButton(with: "СБРОСИТЬ ПАРОЛЬ", buttonType: .blackButton, and: resetPasswordButtonTapped)
    
    
    // MARK: Intialization

    typealias DI = ViewContorllerFactory.LoginDependency

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

    // MARK: Actions
    
    private lazy var resetPasswordButtonTapped = UIAction { [weak self] _ in
        guard self?.newPasswordTextField.text?.isEmpty == false else {
            if let alert = self?.alertFactory.showAlert(title: "Ошибка", alertType: .errorAlert, message: CustomError.zeroCharsPassword) {
                self?.present(alert, animated: true, completion: nil)
            }
            return
        }
        
        self?.validationService.validatePassword(password: (self?.newPasswordTextField.text)!) { success, error in
            guard success
            else {
                if let error = error,
                   let alert = self?.alertFactory.showAlert(title: "Ошибка", alertType: .errorAlert, message: error) {
                    self?.present(alert, animated: true, completion: nil)
                }
                return
            }
            
            self?.validationService.validatePasswordMatch(password: (self?.newPasswordTextField.text)!, repeatPassword: self?.repeatNewPasswordTextField.text) { success, error in
                guard success
                else {
                    if let error = error,
                       let alert = self?.alertFactory.showAlert(title: "Ошибка", alertType: .errorAlert, message: error) {
                        self?.present(alert, animated: true, completion: nil)
                    }
                    return
                }
                
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
        
    }
}
