//
//  PlacesDatabaseManager.swift
//  WeatherApp
//
//  Created by Neringa on 11.04.21.
//

import Foundation

struct PlacesDatabaseManager {
    
    private let databaseManager: CoreDataManager
    
    init(with databaseManager: CoreDataManager) {
        self.databaseManager = databaseManager
    }
    
    func save(places: [PlaceModelItem]) {
        
//        let context = setContext()
//        for newId in newNotificationIds {
//            let newNotification = Notifications(context: context)
//            newNotification.notificationId = Int64(newId)
//            newNotification.notificationState = newNotificationState
//        }
//        do
//            {
//                try context.save()
//                print("Saved new notifications.")
//            }
//        catch { fatalError("Unable to save data.") }
    }
    
    func places(with searchKey: String) -> [PlaceModelItem] {
        
        //            let extractValues: [Notifications]
        //            let context = setContext()
        //            let request = Notifications.notificationFetchRequest()
        //            request.returnsObjectsAsFaults = false
        //            do
        //            {
        //                extractValues = try context.fetch(request)
        //            }
        //            catch { fatalError("Could not load Data") }
        //            completion(extractValues)
        return [PlaceModelItem]()
    }
}
