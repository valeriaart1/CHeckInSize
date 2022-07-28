//
//  File.swift
//  CHeckInSize
//
//  Created by Dmitry Aksyonov on 28.07.2022.
//

import UIKit

enum LoginSceneAssembler {

    static func start() -> UINavigationController {
        let viewContoller = ViewContorllerFatory.make(
            viewController: .loginMainViewController
        )

        return UINavigationController(
            rootViewController: viewContoller
        )
    }
}


