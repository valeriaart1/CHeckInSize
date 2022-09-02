//
//  Constants.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 20.07.22.
//

import UIKit

struct Constants {

    static let dataModelName = "CHeckInSize"
    static let backgroundImageName = "backgroundImage.png"
    static let logoImageName = "logoImage.png"
    static let defaultUserIcon = "defaultUserIcon.png"
    static let strLoginKey = "login"
    static let strUsernameKey = "username"
    static let strPasswordKey = "password"
}

enum CustomColor {
    case lightGreen
    
    //Get Color
    var color: UIColor {
        switch self {
        case .lightGreen:
            return UIColor(named: "lightGreen") ?? .green
        }
    }
}

enum ViewControllerNaming {
    
    //LoginScene
    case loginMainViewController
    case forgotPasswordViewController
    case oneTimePasswordViewController(login: String)
    case passwordCreationViewController(login: String)
    case signupViewController
    
    //TrainingScene
    case trainingMainViewController
}
