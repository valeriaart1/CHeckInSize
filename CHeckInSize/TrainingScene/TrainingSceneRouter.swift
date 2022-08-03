//
//  TrainingSceneRouter.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 28.07.22.
//

import UIKit

final class TrainingSceneRouter {
    
    func route(
        from view: UIViewController?,
        to viewControllerName: ViewControllerNaming,
        presentationStyle: UIModalPresentationStyle = .fullScreen,
        transitionStyle: UIModalTransitionStyle = .crossDissolve,
        navigationType: NavigatuinType = .pushViewController,
        login: String = ""
    ) {

        let viewController = ViewContorllerFactory.make(viewController: viewControllerName)
        setAppearance(from: view, to: viewController, presentStyle: presentationStyle, transStyle: transitionStyle)
        if navigationType == .presentViewController {
            view?.present(viewController, animated: true, completion: nil)
            return
        }
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension TrainingSceneRouter {

    private func setAppearance(
        from view: UIViewController?,
        to mode: UIViewController,
        presentStyle: UIModalPresentationStyle,
        transStyle: UIModalTransitionStyle
    ) {
        mode.modalPresentationStyle = presentStyle
        mode.modalTransitionStyle = transStyle
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        view?.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

