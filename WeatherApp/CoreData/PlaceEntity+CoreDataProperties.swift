//
//  PlaceEntity+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Neringa on 19.07.21.
//
//

import Foundation
import CoreData


extension PlaceEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlaceEntity> {
        return NSFetchRequest<PlaceEntity>(entityName: "PlaceEntity")
    }

    @NSManaged public var administrativeDivision: String?
    @NSManaged public var code: String?
    @NSManaged public var countryCode: String?
    @NSManaged public var name: String?

}

extension PlaceEntity : Identifiable {

}
