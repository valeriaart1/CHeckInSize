//
//  LogicSceneBuilder.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

final class LoginSceneBuilder {
    
    func makeLoginSceneViewController (
        viewControllerName: ViewControllerNaming
    ) -> UILoginViewController {
        
        switch viewControllerName {
            
        case .loginMainViewController:
            return LoginMainViewController.init(router: LoginSceneRouter(), validationService: ValidationService(), loginService: LoginService(), alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
            
        case .oneTimePasswordViewController:
            return OneTimePasswordViewController.init(router: LoginSceneRouter(), validationService: ValidationService(), loginService: LoginService(), alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
            
        case .signupViewController:
            return SignupViewController.init(router: LoginSceneRouter(), validationService: ValidationService(), loginService: LoginService(), alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
            
        case .passwordCreationViewController:
            return PasswordCreationViewController.init(router: LoginSceneRouter(), validationService: ValidationService(), loginService: LoginService(), alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
            
        case .forgotPasswordViewController:
            return ForgotPasswordViewController.init(router: LoginSceneRouter(), validationService: ValidationService(), loginService: LoginService(), alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
            
        case .trainingMainViewController:
//            return TrainingMainViewController.init(router: LoginSceneRouter(), validationService: ValidationService(), loginService: LoginService(), alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
            return LoginMainViewController(router: LoginSceneRouter(), validationService: ValidationService(), loginService: LoginService(), alertFactory: AlertFactory(), uiComponentsFactory: UIComponentsFactory())
            
        }
    }
}

extension LoginSceneBuilder {
    
    func makeLoginSceneViewControllerWithOptions (
        viewControllerName: ViewControllerNaming,
        router: LoginSceneRouter? = LoginSceneRouter(),
        validationService: ValidationService?,
        loginService: LoginService?,
        alertFactory: AlertFactory?,
        uiComponentsFactory: UIComponentsFactory?
    ) -> UIViewController {
        
        let mode = makeLoginSceneViewController (viewControllerName: viewControllerName)
        mode.updateOptionsViewController(
            router: router ?? LoginSceneRouter(),
            validationService: validationService ?? ValidationService(),
            loginService: loginService ?? LoginService(),
            alertFactory: alertFactory ?? AlertFactory(),
            uiComponentsFactory: uiComponentsFactory ?? UIComponentsFactory()
            )
        
        return mode
    }
}
