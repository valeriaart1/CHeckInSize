//
//  LogicSceneRouter.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

final class LoginSceneRouter {
    
    func routingBetweenScenes (
        from view: UIViewController?,
        to viewControllerName: ViewControllerNaming,
        router: LoginSceneRouter?,
        validationService: ValidationService?,
        loginService: LoginService?,
        alertFactory: AlertFactory?,
        uiComponentsFactory: UIComponentsFactory?,
        presentStyle: UIModalPresentationStyle = .fullScreen,
        transStyle: UIModalTransitionStyle = .crossDissolve
    ) {
        let mode = LoginSceneBuilder().makeLoginSceneViewControllerWithOptions(viewControllerName: viewControllerName, router: router, validationService: validationService, loginService: loginService, alertFactory: alertFactory, uiComponentsFactory: uiComponentsFactory)
        view?.navigationController?.pushViewController(mode, animated: true)
        
        setAppearance(from: view, to: mode, presentStyle: presentStyle, transStyle: transStyle)
    }
}

extension LoginSceneRouter {

    private func setAppearance(
        from view: UIViewController?,
        to mode: UIViewController,
        presentStyle: UIModalPresentationStyle,
        transStyle: UIModalTransitionStyle
    ) {
        mode.modalPresentationStyle = presentStyle
        mode.modalTransitionStyle = transStyle
        view?.navigationController?.navigationBar.tintColor = UIColor.black
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        view?.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
