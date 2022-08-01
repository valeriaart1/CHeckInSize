//
//  CoreDataSaveFactory.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 1.08.22.
//

import UIKit
import CoreData

class CoreDataSaveFactory {
    
    static func saveNewUserAccount(
        userLogin: String,
        userFullname: String?,
        userName: String,
        userPassword: String,
        _ completion: @escaping (Bool, CustomError?) -> Void
    ) {
        
        let context = CoreDataService.setContext()
        let userAccount = UserAccount(context: context)
        userAccount.login = userLogin
        userAccount.fullname = userFullname
        userAccount.userName = userName
        userAccount.password = userPassword
        
        do {
            try context.save()
        }
        catch {
            completion(false, CustomError.savingDataError)
        }
        
        completion(true, nil)
    }
}

