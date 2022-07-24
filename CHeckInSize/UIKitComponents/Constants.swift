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
    static let coefficientLeadingAnchor = 0.05
    static let coefficientTrailingAnchor = -0.05
    static let coefficientLogoLoginSceneLeadingAnchor = 0.16
    static let coefficientLogoLoginSceneTrailingAnchor = -0.16
    static let coefficientLogoLoginSceneHeightAnchor = 0.09
    static let coefficientLogoLoginSceneTopAnchor = 0.13
    static let coefficientLoginHeightAnchor = 0.065
    static let coefficientSignUpTopAnchor = 0.006
    static let coefficientLoginTextFieldTopAnchor = 0.34
    static let coefficientPasswordTextFieldTopAnchor = 0.02
}

// MARK: Validation Error

enum LoginMainError: String, Error {
    
    case zeroCaseCredentials = "Не указаны данные для входа"
}

// MARK: - Validation Error

enum ValidationError: String, Error {

    case zeroCharsLogin = "Не указан логин"
    case zeroCharsPassword = "Не указан пароль"
    case zeroCaseCredentials = "Не указаны данные для входа"
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
}

enum CustomAlertType {
    case agreementAlertWithTextField
    case agreementAlert
    case disagreementAlert
    case errorAlert
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
