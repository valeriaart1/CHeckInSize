//
//  LoginService.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

enum LoginError: String, Error {

    case invalidLogin
    case invalidPassword
}

final class LoginService {

    private typealias LError = LoginError

    func login(
        login: String,
        pwd: String,
        _ completion: @escaping (Bool, Error?) -> Void
    ) {
        if true {
            completion(true, nil)
        } else { 
            completion(false, LError.invalidLogin)
        }
    }

}
