//
//  ResponseDecode.swift
//  WeatherApp
//
//  Created by Neringa on 22.02.21.
//

import UIKit

struct WeatherData: Decodable {
    var place: Place?
    var forecastType: String?
    var forecastCreationTimeUtc: String?
    var forecastTimestamps: [ForecastDetails]?
}

struct Place: Decodable {
    let code: String?
    let name: String?
    let administrationDivision: String?
    let country: String?
    let countryCode: String?
    let coordinates: Coordinates?
}

struct Coordinates: Decodable {
    let latitude: Double?
    let longitude: Double?
}

struct ForecastDetails: Decodable {
    let forecastTimeUtc: String?
    let airTemperature: Double?
    let windSpeed: Int?
    let windGust: Int?
    let windDirection: Int?
    let cloudCover: Int?
    let seaLevelPressure: Int?
    let relativeHumidity: Int?
    let totalPrecipitation: Double?
    let conditionCode: String?
}

