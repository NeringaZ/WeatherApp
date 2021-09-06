//
//  PlacesModel.swift
//  WeatherApp
//
//  Created by Neringa on 01.03.21.
//

import Foundation

struct PlacesModel {
    
    private let networkManager: PlacesNetworkManager
    private let databaseManager: PlacesDatabaseManager
    
    init(with networkManager: PlacesNetworkManager, databaseManager: PlacesDatabaseManager) {
        self.networkManager = networkManager
        self.databaseManager = databaseManager
    }

    func getPlaces(with success: @escaping ([PlaceViewModelItem]) -> Void, failure: @escaping () -> Void) {
        
        //1. kreipiames i duombaze,
        //2. ziurim ar gautas rezultatas ne tuscias masyvas
        //3. jei netuscias, tai naudojam places is duombazes
        //4. jei tuscias, darom iprasta uzklausa
        //5. uzklausos response issuagom i database
        
        networkManager.getPlaces { (placesResponse: [PlaceModelItem]) in
            
            var places: [PlaceViewModelItem] = []
            
            for place in placesResponse {
                if let placeItem = PlaceViewModelItem(with: place) {
                    places.append(placeItem)
                }
            }
            
            success(places)
            
        } failure: {
            failure()
        }
    }
    
    func getPlaces(with searchKey: String, success: @escaping ([PlaceViewModelItem]) -> Void, failure: @escaping () -> Void) {
        // cia jau ieskosim is duombazes
    }
}

struct PlaceModelItem: Decodable {
    let code: String?
    let name: String?
    let administrativeDivision: String?
    let countryCode: String?
}
