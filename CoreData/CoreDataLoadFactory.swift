//
//  CoreDataLoadFactory.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 1.08.22.
//

import UIKit
import CoreData

class CoreDataLoadFactory {
    
    static func loadUserAccount(_ completion: @escaping (Bool, CustomError?) -> Void) -> [UserAccount] {
        var extractValues = [UserAccount]()
        let context = CoreDataService.setContext()
        let request = UserAccount.fetchRequest()
        request.returnsObjectsAsFaults = false

        do {
            extractValues = try context.fetch(request)
        }
        catch {
            completion(false, CustomError.loadingDataError)
        }

        return extractValues
    }
}
