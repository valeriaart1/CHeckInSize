//
//  UserAccount+CoreDataProperties.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 1.08.22.
//
//

import Foundation
import CoreData

@objc(UserAccount)
public class UserAccount: NSManagedObject, Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserAccount> {
        return NSFetchRequest<UserAccount>(entityName: "UserAccount")
    }

    @NSManaged public var password: String
    @NSManaged public var userName: String
    @NSManaged public var fullname: String?
    @NSManaged public var login: String

}
