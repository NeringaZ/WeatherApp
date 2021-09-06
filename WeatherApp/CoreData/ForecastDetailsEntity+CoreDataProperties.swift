//
//  ForecastDetailsEntity+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Neringa on 19.07.21.
//
//

import Foundation
import CoreData


extension ForecastDetailsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ForecastDetailsEntity> {
        return NSFetchRequest<ForecastDetailsEntity>(entityName: "ForecastDetailsEntity")
    }

    @NSManaged public var airTemperature: Double
    @NSManaged public var conditionCode: String?
    @NSManaged public var forecastTimeUtc: String?

}

extension ForecastDetailsEntity : Identifiable {

}
