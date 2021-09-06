//
//  CoreDataManager.swift
//  WeatherApp
//
//  Created by Neringa on 11.04.21.
//

import UIKit
import CoreData

class CoreDataManager {
    
    // ka reiskia 15 ir 16 eilutes, kad CoreDataManager yea prieinamas is visur, kad yra singeltonas, jei inicijuojamas ne su AppDelegate, tai klaida?
    static var shared: CoreDataManager {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        return appDelegate.coreDataManager
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DatabaseModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
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
