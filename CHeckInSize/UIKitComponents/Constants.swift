//
//  Constants.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 20.07.22.
//

struct Constants {

    static let dataModelName = "CHeckInSize"
    static let backgroundImageName = "backgroundImage.png"
    static let logoImageName = "logoImage.png"
    static let defaultUserIcon = "defaultUserIcon.png"
    static let strLoginKey = "login"
    static let strUsernameKey = "username"
    static let strPasswordKey = "password"
}

enum ViewControllerNaming {
    
    //LoginScene
    case loginMainViewController
    case forgotPasswordViewController
    case oneTimePasswordViewController(login: String?)
    case passwordCreationViewController
    case signupViewController
    
    //TrainingScene
    case trainingMainViewController
}
