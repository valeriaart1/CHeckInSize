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
    
    //CoreDataError
    case savingDataError = "Ошибка сохранения записи в базу данных"
    case loadingDataError = "Ошибка получения записей из базы данных"
    
    //SignUpError
    case userLoginIsEmpty = "Пожалуйста, заполните поле логина пользователя"
    case userNameIsEmpty = "Пожалуйста, заполните поле имя пользователя"
    case userPasswordIsEmpty = "Пожалуйста, заполните поле пароля"
    
    //CreationPasswordError
    case insufficientPasswordLength = "Длина пароля должна быть не менее 8 символов"
    case uncorrectLogicPassword = "Пожалуйста, составьте Ваш пароль, включая в него буквы, а также цифры или спецсимволы (!$@%)"
    case passwordMismatch = "Пароли не совпадают"
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
        cancelButtonText: String = "",
        agreementButtonText: String = "",
        textFieldPlaceholder: String = ""
    ) -> UIAlertController {
        
        let alert = CustomAlert.showAlert(
            title: title,
            message: message.rawValue,
            alertType: alertType,
            cancelButtonText: cancelButtonText,
            agreementButtonText: agreementButtonText,
            textFieldPlaceholder: textFieldPlaceholder
        )

        return alert
    }
}
