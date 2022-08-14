//
//  ViewControllerFactory.swift
//  CHeckInSize
//
//  Created by Dmitry Aksyonov on 26.07.2022.
//

import UIKit

final class ViewContorllerFactory {

    private static var loginDependencyContainer: LoginDependency {
        LoginDependency (
            router: LoginSceneRouter(),
            validationService: ValidationService(),
            loginService: LoginService(),
            firebaseServiceUserAccount: FirebaseServiceUserAccount(),
            alertFactory: AlertFactory(),
            uiComponentsFactory: UIComponentsFactory()
        )
    }
    
    private static var trainingDependencyContainer: TrainingDependency {
        TrainingDependency (
            router: TrainingSceneRouter(),
            alertFactory: AlertFactory(),
            uiComponentsFactory: UIComponentsFactory()
        )
    }

    static func make(viewController type: ViewControllerNaming) -> UIViewController {
        switch type {
        case .loginMainViewController:
            return LoginMainViewController(
                with: loginDependencyContainer
            )
        case .forgotPasswordViewController:
            return ForgotPasswordViewController(
                with: loginDependencyContainer
            )
        case .oneTimePasswordViewController(let login):
            return OneTimePasswordViewController(
                with: loginDependencyContainer, login: login
            )
        case .passwordCreationViewController(let login):
            return PasswordCreationViewController(
                with: loginDependencyContainer, login: login
            )
        case .signupViewController:
            return SignupViewController(
                with: loginDependencyContainer
            )
        case .trainingMainViewController:
            return TrainingMainViewController(
                with: trainingDependencyContainer
            )
        }
    }
}

extension ViewContorllerFactory {

    struct LoginDependency {
        let router: LoginSceneRouter
        let validationService: ValidationService
        let loginService: LoginService
        let firebaseServiceUserAccount: FirebaseServiceUserAccount
        let alertFactory: AlertFactory
        let uiComponentsFactory: UIComponentsFactory
    }
    
    struct TrainingDependency {
        let router: TrainingSceneRouter
        let alertFactory: AlertFactory
        let uiComponentsFactory: UIComponentsFactory
    }
}
