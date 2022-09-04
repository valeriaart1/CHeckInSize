//
//  OneTimePasswrodView.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 23.08.22.
//

import UIKit
import SnapKit

class OneTimePasswordView: UILoginViewController {
    
    var login: String
    
    private lazy var header: UILabel = UILabel.makeLabel(with: "Ввод кода безопасности", labelType: .labelWithNunitoBold, size: nil)
    private lazy var instructionEnterCodeLabel: UILabel = UILabel.makeLabel(with: "Введите 6-значный код, который мы отправили на почту", labelType: .labelWithNunito, size: nil)
    private lazy var codeTextField: UITextField = UITextField.makeTextField(with: "Код", fieldType: .loginScreenTextField)
    private lazy var getNewCodeButton: UIButton = UIButton.makeButton(with: "Получить новый код", buttonType: .buttonWithNunitoBoldUnderline, and: getNewCodeTapped)
    private lazy var confirmButton: UIButton = UIButton.makeButton(with: "ПОДТВЕРДИТЬ", buttonType: .blackButton(cornerRadius: 20, backgroundColor: .black, titleColor: .white, size: 15), and: confirmButtonTapped)

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
            instructionEnterCodeLabel,
            codeTextField,
            getNewCodeButton,
            confirmButton
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
        
        instructionEnterCodeLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginInstructionTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginInstructionHeightAnchor * view.frame.height)
         }
        
        codeTextField.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginThirdTextFieldTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
         }
        
        getNewCodeButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginUnderTextFieldButtonTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginLabelUnderLineButtonHeightAnchor * view.frame.height)
         }
        
        confirmButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.view).offset(LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.trailing.equalTo(self.view).offset(-LoginConstantsAnchor.coeffLeadingTrailingAnchor * view.frame.width)
            make.top.equalTo(self.view).offset(LoginConstantsAnchor.coeffLoginMainButtonTopAnchor * view.frame.height)
            make.height.equalTo(LoginConstantsAnchor.coeffLoginTextFieldButtonHeightAnchor * view.frame.height)
         }
    }

    // MARK: Actions
    
    private lazy var confirmButtonTapped = UIAction { [weak self] _ in
        
        guard let self = self
        else {
            return
        }
        
        self.router.route(
            from: self,
            to: .passwordCreationViewController(login: self.login)
        )
    }
    
    private lazy var getNewCodeTapped = UIAction { [weak self] _ in
        print("")
    }
}
