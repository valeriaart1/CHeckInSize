//
//  ViewControllerFactory.swift
//  CHeckInSize
//
//  Created by Dmitry Aksyonov on 26.07.2022.
//

import UIKit

final class ViewContorllerFatory {

    private static var dependencyContainer: Dependency {
        Dependency(
            router: LoginSceneRouter(),
            validationService: ValidationService(),
            loginService: LoginService(),
            alertFactory: AlertFactory(),
            uiComponentsFactory: UIComponentsFactory()
        )
    }

    static func make(viewController type: ViewControllerNaming) -> UIViewController {
        switch type {
        case .loginMainViewController:
            return LoginMainViewController(
                with: dependencyContainer
            )
        case .forgotPasswordViewController:
            return ForgotPasswordViewController(
                with: dependencyContainer
            )
        case .oneTimePasswordViewController:
            return UIViewController()
        case .passwordCreationViewController:
            return UIViewController()
        case .signupViewController:
            return UIViewController()
        case .trainingMainViewController:
            return UIViewController()
        }
    }
}

extension ViewContorllerFatory {

    struct Dependency {
        let router: LoginSceneRouter
        let validationService: ValidationService
        let loginService: LoginService
        let alertFactory: AlertFactory
        let uiComponentsFactory: UIComponentsFactory
    }
}
