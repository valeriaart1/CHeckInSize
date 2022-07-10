//
//  ValidationService.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

// MARK: - Validation Error

enum ValidationError: String, Error {

    case zeroCharsLogin = "Не указан логин"
    case zeroCharsPassword = "Не указан пароль"
    case zeroCaseCredentials = "Не указаны данные для входа"
}

// MARK: - ValidationService

final class ValidationService {

    private typealias VError = ValidationError

    func validate(
        login: String?,
        and password: String?,
        _ completion: @escaping (Bool, Error?) -> Void
    ) {
        switch (login, password) {
        case (nil, nil):
            completion(false, VError.zeroCaseCredentials)
        case (nil, _):
            completion(false, VError.zeroCharsLogin)
        case (_, nil):
            completion(false, VError.zeroCharsPassword)
        default:
            completion(true, nil)
        }
    }
}
