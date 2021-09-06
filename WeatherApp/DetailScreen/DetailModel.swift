//
//  DetailModel.swift
//  WeatherApp
//
//  Created by Neringa on 24.02.21.
//

import UIKit

struct DetailModel {
    
    private let networkManager: DetailNetworkManager
    
    init (with networkManager: DetailNetworkManager) {
        self.networkManager = networkManager
    }
    //ar String neturi buti optional? ir DetailNetworkManager ne optional
    func getWeatherDetails(for placeCode: String, success: @escaping () -> Void, failure: @escaping () -> Void) {
        networkManager.getWeatherDetails(for: placeCode) { (forecast: (WeatherData)) -> Void in
            
//            success(forecast)
            
        } failure: {
            failure ()
            
        }
    }
}

//func getPlaces(with success: @escaping ([PlaceViewModelItem]) -> Void, failure: @escaping () -> Void) {
//    networkManager.getPlaces { (placesResponse: [PlaceModelItem]) in
//        
//        var places: [PlaceViewModelItem] = []
//        
//        for place in placesResponse {
//            if let placeItem = PlaceViewModelItem(with: place) {
//                places.append(placeItem)
//            }
//        }
//        
//        success(places)
//        
//    } failure: {
//        failure()
//    }
//    
//}
//}

// Reikes susikurti processed weather data, kur isirinksiu kas turi buti ne optional, o kas optional
