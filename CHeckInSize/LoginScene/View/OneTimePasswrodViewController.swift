//
//  OneTimePasswrodViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class OneTimePasswordViewController: UIViewController {

    private let uikitTemplate = UIKitTemplate()

    // MARK: Properties

    private let alertFactory: AlertFactory
    private let uiComponentsFactory: UIComponentsFactory
    private lazy var logoImage: UIImageView = uikitTemplate.logoImage
    private lazy var appName: UILabel = uikitTemplate.appName
    private lazy var header: UILabel = uiComponentsFactory.makeLabel(with: "Ввод кода безопасности", labelType: .labelWithNunitoBold, size: nil, textAligment: nil)
    private lazy var instructionEnterCodeLabel: UILabel = uiComponentsFactory.makeLabel(with: "Введите 6-значный код, который мы отправили на почту", labelType: .labelWithNunito, size: nil, textAligment: nil)
    private lazy var codeTextField: UITextField = uiComponentsFactory.makeTextField(with: "Код", fieldType: .loginScreenTextField)
    private lazy var getNewCodeButton: UIButton = uiComponentsFactory.makeButton(with: "Получить новый код", buttonType: .buttonWithNunitoBoldUnderline, and: getNewCodeTapped, contentAligment: nil)
    private lazy var confirmButton: UIButton = uiComponentsFactory.makeButton(with: "ПОДТВЕРДИТЬ", buttonType: .blackButton, and: confirmButtonTapped, contentAligment: nil)


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
            instructionEnterCodeLabel,
            codeTextField,
            getNewCodeButton,
            confirmButton
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
            instructionEnterCodeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            instructionEnterCodeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            instructionEnterCodeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginInstructionTopAnchor * view.frame.height),
            instructionEnterCodeLabel.heightAnchor.constraint(equalToConstant: Constants.coeffLoginInstructionHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            codeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            codeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            codeTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginThirdTextFieldTopAnchor * view.frame.height),
            codeTextField.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            getNewCodeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            getNewCodeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            getNewCodeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginUnderTextFieldButtonTopAnchor * view.frame.height),
            getNewCodeButton.heightAnchor.constraint(equalToConstant: Constants.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            confirmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.coeffLeadingTrailingAnchor * view.frame.width),
            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.coeffLeadingTrailingAnchor * view.frame.width),
            confirmButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.coeffLoginMainButtonTopAnchor * view.frame.height),
            confirmButton.heightAnchor.constraint(equalToConstant: Constants.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
        ])
    }

    // MARK: Actions
    
    private lazy var confirmButtonTapped = UIAction { [weak self] _ in
        print("")
    }
    
    private lazy var getNewCodeTapped = UIAction { [weak self] _ in
        print("")
    }
}
