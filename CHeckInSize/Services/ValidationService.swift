//
//  ValidationService.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

// MARK: - ValidationService

final class ValidationService {

    private typealias VError = CustomError

    func validateLogin(
        login: String,
        and password: String,
        _ completion: @escaping (Bool, CustomError?) -> Void
    ) {
        
        guard !(login.isEmpty && password.isEmpty)
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
    
    func validateSignup(
        userLogin: String?,
        userName: String?,
        userPassword: String?,
        _ completion: @escaping (Bool, CustomError?) -> Void
    ) {
        switch (userLogin?.isEmpty, userName?.isEmpty, userPassword?.isEmpty) {
            case (true, _, _):
                completion(false,CustomError.userLoginIsEmpty)
            case (_, true, _):
                completion(false,CustomError.userNameIsEmpty)
            case (_, _, true):
                completion(false,CustomError.userPasswordIsEmpty)
            default:
                completion(true, nil)
        }
    }
}


