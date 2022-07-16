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

extension String {

    var isEmpty: Bool {

        count == 0 ? true : false
    }
}

// MARK: - ValidationService

final class ValidationService {

    private typealias VError = ValidationError

    func validate(
        login: String,
        and password: String,
        _ completion: @escaping (Bool, Error?) -> Void
    ) {
        guard !login.isEmpty,
              !password.isEmpty
        else {
            completion(false, VError.zeroCaseCredentials)
            return
        }
        
        switch (login.isEmpty, password.isEmpty) {
        case (true, _):
            completion(false, VError.zeroCharsLogin)
        case (_, true):
            completion(false, VError.zeroCharsPassword)
        default:
            completion(true, nil)
        }
    }
}


