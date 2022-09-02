//
//  TrainingSceneBuilder.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 28.07.22.
//

import UIKit

enum TrainingSceneAssembler {

    static func start() -> UINavigationController {
        let viewContoller = ViewControllerFactory.make(
            viewController: .trainingMainViewController
        )

        return UINavigationController(
            rootViewController: viewContoller
        )
    }
}
