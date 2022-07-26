//
//  LogicSceneBuilder.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

final class LoginSceneBuilder {
    
//    func makeMainViewController() -> UIViewController {
//        let view = LoginMainViewController.init(router: LoginSceneRouter(), validationService: ValidationService(), loginService: LoginService(), alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
//
//        let navigationController = UINavigationController(rootViewController: view)
//        return navigationController
//    }
    
    func makeLoginSceneViewController(
        viewControllerName: ViewControllerNaming,
        router: LoginSceneRouter,
        validationService: ValidationService,
        loginService: LoginService
    ) -> UIViewController {
        
        var view: UIViewController?
        let alertFactory = AlertFactory()
        let uiComponentsFactory = UIComponentsFactory()
        
        switch viewControllerName {
            
        case .LoginMainViewController:
            view = LoginMainViewController.init(router: router, validationService: validationService, loginService: loginService, alertFactory: alertFactory, uiComponentsFactory: uiComponentsFactory)
            
        case .OneTimePasswordViewController:
            view = OneTimePasswordViewController.init(alertFactory: alertFactory, uiComponentsFactory: uiComponentsFactory)
            
        case .SignupViewController:
            view = SignupViewController.init(alertFactory: alertFactory, uiComponentsFactory: uiComponentsFactory)
            
        case .PasswordCreationViewController:
            view = PasswordCreationViewController.init(alertFactory: alertFactory, uiComponentsFactory: uiComponentsFactory)
            
        case .ForgotPasswordViewController:
            view = ForgotPasswordViewController.init(alertFactory: alertFactory, uiComponentsFactory: uiComponentsFactory)
            
        }
        
        let navigationController = UINavigationController(rootViewController: view ?? UIViewController())
        
        return navigationController
    }
    
//    func makeForgotPasswordController() -> UIViewController {
//        let view = ForgotPasswordViewController.init(alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
//
//        let navigationController = UINavigationController(rootViewController: view)
//        return navigationController
//    }
//
//    func makeOneTimePasswordController() -> UIViewController {
//        let view = OneTimePasswordViewController.init(alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
//
//        let navigationController = UINavigationController(rootViewController: view)
//        return navigationController
//    }
//
//    func makePasswordCreationController() -> UIViewController {
//        let view = PasswordCreationViewController.init(alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
//
//        let navigationController = UINavigationController(rootViewController: view)
//        return navigationController
//    }
//
//    func makeSignupController() -> UIViewController {
//        let view = SignupViewController.init(alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
//
//        let navigationController = UINavigationController(rootViewController: view)
//        return navigationController
//    }
}
