//
//  KeyChainWrapperService.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 2.08.22.
//
import SwiftKeychainWrapper

final class KeyChainWrapperService {
    func keyChain (
        login: String,
        password: String?
    ) {
        let _: Bool = KeychainWrapper(serviceName: Constants.dataModelName).set(login, forKey: Constants.strLoginKey)
        
        if let password = password {
            let _: Bool = KeychainWrapper(serviceName: Constants.dataModelName).set(password, forKey: Constants.strPasswordKey)
        }
    }
}
