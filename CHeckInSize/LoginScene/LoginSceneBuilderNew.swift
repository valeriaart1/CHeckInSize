//
//  File.swift
//  CHeckInSize
//
//  Created by Dmitry Aksyonov on 28.07.2022.
//

import UIKit

enum NavigatuinType {
    
    case presentViewController
    case pushViewController
}

enum LoginSceneAssembler {

    static func start() -> UINavigationController {
        let viewContoller = ViewContorllerFactory.make(
            viewController: .loginMainViewController
        )

        return UINavigationController(
            rootViewController: viewContoller
        )
    }
}


