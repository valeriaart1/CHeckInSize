//
//  LoginService.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 10.07.22.
//

final class LoginService {
    
    private typealias LError = CustomError

    func login(
                login: String,
                pwd: String,
                _ completion: @escaping (Bool, CustomError?) -> Void
    ) {
        
        FirebaseServiceUserAccount().getUsers() { users, error in
            guard !users.isEmpty
            else {
                if let error = error {
                    completion(false, error)
                }
                return
            }
    
            for user in users {
                switch (login, pwd) {
                case (user.login, user.password):
                    completion(true, nil)
                    return
                case (user.userName, user.password):
                    completion(true, nil)
                    return
                case (user.login, _):
                    completion(false, LError.uncorrectPassword)
                    return
                case (user.userName, _):
                    completion(false, LError.uncorrectPassword)
                    return
                case (_, _):
                    break
                }
            }
        
            completion(false, LError.usernameNotBelongAccount)
        }
    }
}
