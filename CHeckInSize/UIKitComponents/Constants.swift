//
//  Constants.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 20.07.22.
//

import UIKit

struct Constants {
    static let backgroundImageName = "backgroundImage.png"
    static let logoImageName = "logoImage.png"
    static let coeffLeadingTrailingAnchor = 0.08
    static let coeffLogoHeightAnchor = 0.1
    static let coeffLoginLogoTopAnchor = 0.14
    static let coeffLoginLogoImageWidthAnchor = 0.21
    static let coeffLoginAppNameWidthAnchor = 0.64
    static let coeffLoginLabelUnderLineButtonHeightAnchor = 0.037
    static let coeffLoginTextFieldButtonHeightAnchor = 0.064
    static let coeffLoginInstructionHeightAnchor = 0.099
    static let coeffLoginHeaderTopAnchor = 0.286
    static let coeffLoginInstructionTopAnchor = 0.335
    static let coeffLoginFirstTextFieldTopAnchor = 0.309
    static let coeffLoginSecondTextFieldTopAnchor = 0.398
    static let coeffLoginThirdTextFieldTopAnchor = 0.488
    static let coeffLoginFouthTextFieldTopAnchor = 0.578
    static let coeffLoginUnderTextFieldButtonTopAnchor = 0.562
    static let coeffLoginMainButtonTopAnchor = 0.714
    static let coeffLoginUnderButtonTopAnchor = 0.788
    static let coeffLoginUnderButtonWidthAnchor = 0.562
}

// MARK: - Validation Error

enum ValidationError: String, Error {

    case zeroCharsLogin = "Не указан логин"
    case zeroCharsPassword = "Не указан пароль"
    case zeroCaseCredentials = "Не указаны данные для входа"
    case uncorrectPassword = "Введен неверный пароль"
    case usernameNotBelongAccount = "Введенное имя пользователя не принадлежит аккаунту"
}

enum CustomButtonType {

    case blackButton
    case buttonWithNunitoBoldUnderline
}

enum CustomTextFieldType {
    case loginScreenTextField
    case namingTextFieldAlert
}

enum CustomLabelType {
    case labelWithNunito
    case labelWithNunitoBold
}

enum CustomAlertType {
    case agreementAlertWithTextField
    case agreementAlert
    case disagreementAlert
    case errorAlert
}

enum ViewControllerNaming {
    case LoginMainViewController
    case ForgotPasswordViewController
    case OneTimePasswordViewController
    case PasswordCreationViewController
    case SignupViewController
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: Int) {
       self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha)/100.0)
    }

    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if cString.count != 6 {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            var rgbValue:UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)

            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(alpha)
            )
        }
    }
}

enum CHISColor  {
    case lightGreen

    //Get Color
    var color: UIColor {
        switch self {
        case .lightGreen:
            return UIColor.init(hexString: "#D5ECC2", alpha: 1)
        }
    }
}
