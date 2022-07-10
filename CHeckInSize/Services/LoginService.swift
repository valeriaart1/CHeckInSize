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
        } else { //нужно смотреть, есть ли в базе такой логин, если нет, то invalidLogin, если логин есть, а пароль неверный - invalidPassword
            completion(false, LError.invalidLogin)
        }
    }

}
