//
//  LogicSceneRouter.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

final class LoginSceneRouter: UINavigationController {
    
    func routingBetweenScenes (
        from view: UIViewController,
        to mode: UIViewController,
        presentStyle: UIModalPresentationStyle?,
        transStyle: UIModalTransitionStyle?
    ) {
        mode.modalPresentationStyle = presentStyle ?? .fullScreen
        mode.modalTransitionStyle = transStyle ?? .partialCurl
        view.present(mode, animated: true, completion: nil)
    }
    
//    func routeToTrainingScene() {
//
//    }
}
