//
//  LoginMainViewController.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit
import SwiftKeychainWrapper
import SnapKit

class LoginMainViewController: UILoginViewController {
    
    private var loginMainView: LoginMainView
    typealias DI = ViewControllerFactory.LoginDependency
    
    init(
        with container: DI,
        loginMainView: LoginMainView
    ) {
        self.loginMainView = loginMainView
        
        super.init(
            router: container.router,
            validationService: container.validationService,
            loginService: container.loginService,
            firebaseServiceUserAccount: container.firebaseServiceUserAccount,
            uiLoginView: container.uiLoginView
        )
    }
        
    override func loadView() {
        view = loginMainView
    }
    
    @available(*, unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Actions

//    private lazy var loginButtonTapped = UIAction { [weak self] _ in
//        guard let login = loginTextField.text,
//              let pwd = passwordTextField.text
//
//        else {
//            let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: CustomError.zeroCaseCredentials)
//            self?.present(alert, animated: true, completion: nil)
//
//            return
//        }
//
//        self?.validationService.validateLogin(login: login, and: pwd) { success, error in
//            guard success
//            else {
//                if let error = error {
//                   let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: error)
//                    self?.present(alert, animated: true, completion: nil)
//                }
//                return
//            }
//
//            self?.loginService.login(login: login, pwd: pwd) { success, error in
//                guard success
//                else {
//                    if let error = error {
//                       let alert = UIAlertController.showAlert(title: "Ошибка", alertType: .errorAlert, message: error)
//                       self?.present(alert, animated: true, completion: nil)
//                    }
//                    return
//                }
//
//                guard let self = self
//                else {
//                    return
//                }
//
//                KeyChainWrapperService().keyChain(login: login, password: pwd)
//
//                self.router.route (
//                   from: self,
//                   to: .trainingMainViewController,
//                   navigationType: .presentViewController
//                )
//            }
//        }
//    }
//
//    private lazy var signUpButtonTapped = UIAction { [weak self] _ in
//
//        guard let self = self
//        else {
//            return
//        }
//
//        self.router.route(
//            from: self,
//            to: .signupViewController
//        )
//    }
//
//    private lazy var forgotPasswordButtonTapped = UIAction { [weak self] _ in
//
//        guard let self = self
//        else {
//            return
//        }
//
//        self.router.route(
//            from: self,
//            to: .forgotPasswordViewController
//        )
//    }
}
