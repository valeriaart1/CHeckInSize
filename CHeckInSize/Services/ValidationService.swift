//
//  ValidationService.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

// MARK: - ValidationService

import Foundation

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
                completion(false,VError.userLoginIsEmpty)
            case (_, true, _):
                completion(false,VError.userNameIsEmpty)
            case (_, _, true):
                completion(false,VError.userPasswordIsEmpty)
            default:
                completion(true, nil)
        }
    }
    
    func validatePassword(
        password: String,
        _ completion: @escaping (Bool, CustomError?) -> Void
    ) {
        guard password.lengthOfBytes(using: .ascii) >= 8 else {
            completion(false,VError.insufficientPasswordLength)
            return
        }
        
        let pwd = password.trimmingCharacters(in: CharacterSet.whitespaces)
        let regex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        guard predicate.evaluate(with: pwd) == true else {
            completion(false,VError.uncorrectLogicPassword)
            return
        }
        
        completion(true, nil)
    }
    
    func validatePasswordMatch(
        password: String,
        repeatPassword: String?,
        _ completion: @escaping (Bool, CustomError?) -> Void
    ) {
        guard password == repeatPassword else {
            completion(false,VError.passwordMismatch)
            return
        }
        
        completion(true, nil)
    }
}


