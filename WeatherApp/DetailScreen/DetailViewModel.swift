//
//  DetailViewModel.swift
//  WeatherApp
//
//  Created by Neringa on 30.03.21.
//

import UIKit

protocol DetailViewModelDelegate: AnyObject {
    func reloadData()
}

class DetailViewModel: NSObject {
    
    private let model: DetailModel
    
    init(with model: DetailModel){
        self.model = model
    }
    
    func getCurrentForecasts() -> [CurrentForecastItem] {
        return [CurrentForecastItem()]
    }
    
    func getNearestForecasts() -> [CurrentForecastItem] {
        return [CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem()]
    }
    
    func getWeekForecasts() -> [CurrentForecastItem] {
        return [CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem(),
                CurrentForecastItem()]
    }
    
    func getWeatherDetails(for placeCode: String, success: @escaping () -> Void, failure: @escaping () -> Void) {
        model.getWeatherDetails(for: placeCode) {
            //
            
        } failure: {
            //
        }
    }
}

struct WeatherViewModelData {
    let forecastsByHour: [ForecastItem]
    let forecastsByDay: [DayForecastItem]
}

struct ForecastItem {
    let forecastTime: Date
    let airTemperature: Double
    let conditionCode: String

//    init(with: ForecastDetails) {
//
//    }
}

struct DayForecastItem {
    let maxTemp: Double
    let minTemp: Double
    let date: Date
}

// kaip galima konvertuoti utc stringa i date, dateFormatter
