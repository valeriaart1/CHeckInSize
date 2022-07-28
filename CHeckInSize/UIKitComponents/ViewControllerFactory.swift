//
//  ViewControllerFactory.swift
//  CHeckInSize
//
//  Created by Dmitry Aksyonov on 26.07.2022.
//

import UIKit

final class ViewContorllerFatory {


    func makeViewController(
        of type: ViewControllerNaming,
        loginService: LoginService? = nil,
        coreDataService: CoreDataService? = nil,
        validationService: ValidationService? = nil
    ) -> UIViewController
    {
        let view: UIViewController = UIViewController()
//        switch type {
//        case .LoginMainViewController:
//            view = LoginMainViewController.init(router: router, validationService: validationService, loginService: loginService, alertFactory: alertFactory, uiComponentsFactory: uiComponentsFactory)
//
//        case .OneTimePasswordViewController:
//            view = OneTimePasswordViewController.init(alertFactory: alertFactory, uiComponentsFactory: uiComponentsFactory)
//
//        case .SignupViewController:
//            view = SignupViewController.init(alertFactory: alertFactory, uiComponentsFactory: uiComponentsFactory)
//
//        case .PasswordCreationViewController:
//            view = PasswordCreationViewController.init(alertFactory: alertFactory, uiComponentsFactory: uiComponentsFactory)
//
//        case .ForgotPasswordViewController:
//            view = ForgotPasswordViewController.init(alertFactory: alertFactory, uiComponentsFactory: uiComponentsFactory)
//
//        }
        return view
    }
}
