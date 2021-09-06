//
//  PlacesNetworkManager.swift
//  WeatherApp
//
//  Created by Neringa on 01.03.21.
//

import Foundation

struct PlacesNetworkManager {
    
    private let networkManager: NetworkManager
    
    init(with networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getPlaces(success: @escaping ([PlaceModelItem]) -> Void, failure: @escaping () -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.meteo.lt"
        components.path = "/v1/places"

        networkManager.performRequest(method: .get, urlComponents: components) { (data: Data) in
            do {
                let response = try JSONDecoder().decode([PlaceModelItem].self, from: data)
                success(response)
                
            } catch {
                failure()
            }
            
        }  failure: {
            failure()
        }
    }
}
