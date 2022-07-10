//
//  ForgotPasswordViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    private var validationService: ValidationService
    private var loginService: LoginService


    init(
        validationService: ValidationService,
        loginService: LoginService
    ) {
        self.validationService = validationService
        self.loginService = loginService

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
