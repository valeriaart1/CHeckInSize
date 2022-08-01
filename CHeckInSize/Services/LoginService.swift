//
//  LoginService.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

final class LoginService {

    func login(
                login: String,
                pwd: String,
                _ completion: @escaping (Bool, CustomError?) -> Void
    ) {
        
            let users = CoreDataLoadFactory.loadUserAccount( { success, error in
                guard (error == nil) else {
                    completion(false, error)
                    return
                }
            })
        
            for user in users {
                switch (login, pwd) {
                case (user.login, user.password):
                    completion(true, nil)
                    return
                case (user.userName, user.password):
                    completion(true, nil)
                    return
                case (user.login, _):
                    completion(false, CustomError.uncorrectPassword)
                    return
                case (user.userName, _):
                    completion(false, CustomError.uncorrectPassword)
                    return
                case (_, _):
                    break
                }
            }
        
            completion(false, CustomError.usernameNotBelongAccount)
    }
}
