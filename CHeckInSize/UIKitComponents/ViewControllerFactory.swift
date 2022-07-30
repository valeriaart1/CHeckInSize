//
//  ViewControllerFactory.swift
//  CHeckInSize
//
//  Created by Dmitry Aksyonov on 26.07.2022.
//

import UIKit

final class ViewContorllerFactory {

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
            return OneTimePasswordViewController(
                with: dependencyContainer
            )
        case .passwordCreationViewController:
            return PasswordCreationViewController(
                with: dependencyContainer
            )
        case .signupViewController:
            return SignupViewController(
                with: dependencyContainer
            )
        case .trainingMainViewController:
            return UIViewController()
//            return TrainingMainViewController(
//                with: dependencyContainer
//            )
        }
    }
}

extension ViewContorllerFactory {

    struct Dependency {
        let router: LoginSceneRouter
        let validationService: ValidationService
        let loginService: LoginService
        let alertFactory: AlertFactory
        let uiComponentsFactory: UIComponentsFactory
    }
}
