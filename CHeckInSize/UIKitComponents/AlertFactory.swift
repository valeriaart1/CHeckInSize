//
//  AlertFactory.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

import UIKit

// MARK: - Validation Error

enum CustomError: String, Error {

    //ValidationError
    case zeroCharsLogin = "Не указан логин"
    case zeroCharsPassword = "Не указан пароль"
    case zeroCaseCredentials = "Не указаны данные для входа"
    case uncorrectPassword = "Введен неверный пароль"
    case usernameNotBelongAccount = "Введенное имя пользователя не принадлежит аккаунту"
    
    //
}

enum CustomAlertType {
    
    case agreementAlertWithTextField
    case agreementAlert
    case disagreementAlert
    case errorAlert
}

final class AlertFactory  {

    func showAlert(
        title: String,
        alertType: CustomAlertType,
        message: CustomError,
        preferredStyle: UIAlertController.Style = .alert,
        cancelButtonText: String = "",
        agreementButtonText: String = "",
        textFieldPlaceholder: String = ""
    ) -> CustomAlert {
        let alert = CustomAlert(
            title: title,
            message: message.rawValue,
            preferredStyle: preferredStyle,
            alertType: alertType,
            cancelButtonText: cancelButtonText,
            agreementButtonText: agreementButtonText,
            textFieldPlaceholder: textFieldPlaceholder
        )

        return alert
    }
}
