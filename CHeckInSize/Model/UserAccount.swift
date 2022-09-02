//
//  UserAccount.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 3.08.22.
//

import Foundation

struct UserAccount: Codable {
    var login: String
    var fullname: String?
    var userName: String
    var password: String
}
