//
//  UserAccount+CoreDataProperties.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 13.07.22.
//
//

import Foundation
import CoreData


extension UserAccount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserAccount> {
        return NSFetchRequest<UserAccount>(entityName: "UserAccount")
    }

    @NSManaged public var password: String?
    @NSManaged public var login: String?

}

extension UserAccount : Identifiable {

}
