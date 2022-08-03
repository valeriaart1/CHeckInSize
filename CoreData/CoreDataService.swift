//
//  CoreDataService.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 13.07.22.
//

import Foundation
import CoreData

class CoreDataService {
    
    static func setContext() ->NSManagedObjectContext {
        let context = CoreDataService().persistentContainer.viewContext
        return context
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.dataModelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
