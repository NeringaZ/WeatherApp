//
//  DetailNetworkManager.swift
//  WeatherApp
//
//  Created by Neringa on 24.02.21.
//

import Foundation

struct DetailNetworkManager {
    
    private let networkManager: NetworkManager
    
    init(with networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getWeatherDetails(for placeCode: String, success: @escaping (WeatherData) -> Void, failure: @escaping () -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.meteo.lt"
        components.path = "/v1/places/\(placeCode)/forecasts/long-term"
        
        networkManager.performRequest(method: .get, urlComponents: components) { (data: Data) in
            do {
                let response = try JSONDecoder().decode(WeatherData.self, from: data)
                success(response)
                
            } catch {
                failure()
            }
            
        }  failure: {
            failure()
        }
    }
}


