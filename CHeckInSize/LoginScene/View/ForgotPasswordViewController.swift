//
//  ForgotPasswordViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    private let uikitTemplate = UIKitTemplate()

    // MARK: Properties

    private let alertFactory: AlertFactory
    private let uiComponentsFactory: UIComponentsFactory
    private lazy var logoImage: UIImageView = uikitTemplate.logoImage
    private lazy var appName: UILabel = uikitTemplate.appName
    private lazy var header: UILabel = uiComponentsFactory.makeLabel(with: "Не удается войти?", labelType: .labelWithNunitoBold, size: nil)
    private lazy var instructionChangingPasswordLabel: UILabel = uiComponentsFactory.makeLabel(with: "Введите свой электронный адрес, имя пользователя или номер телефона, и мы отправим вам ссылку для восстановления доступа к аккаунту.", labelType: .labelWithNunito, size: nil)
    private lazy var loginTextField: UITextField = uiComponentsFactory.makeTextField(with: "Эл. адрес, телефон или имя пользователя", fieldType: .loginScreenTextField)
    private lazy var createNewAccountButton: UIButton = uiComponentsFactory.makeButton(with: "Создать новый аккаунт", buttonType: .buttonWithNunitoBoldUnderline, and: nil)
    private lazy var getLoginLinkButton: UIButton = uiComponentsFactory.makeButton(with: "ПОЛУЧИТЬ ССЫЛКУ ДЛЯ ВХОДА", buttonType: .blackButton, and: nil)


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
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginHeaderTopAnchor * view.frame.height),
            header.heightAnchor.constraint(equalToConstant: Constants.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            instructionChangingPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            instructionChangingPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            instructionChangingPasswordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginInstructionTopAnchor * view.frame.height),
            instructionChangingPasswordLabel.heightAnchor.constraint(equalToConstant: Constants.coeffLoginInstructionHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginThirdTextFieldTopAnchor * view.frame.height),
            loginTextField.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            createNewAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            createNewAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            createNewAccountButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginUnderTextFieldButtonTopAnchor * view.frame.height),
            createNewAccountButton.heightAnchor.constraint(equalToConstant: Constants.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            getLoginLinkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            getLoginLinkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            getLoginLinkButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginMainButtonTopAnchor * view.frame.height),
            getLoginLinkButton.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
    }

    // MARK: Methods

    @objc private func getLoginLinkButtonTapped() {
        //
    }
}
