//
//  PlacesFactory.swift
//  WeatherApp
//
//  Created by Neringa on 19.03.21.
//

import UIKit

struct PlacesFactory {
    
    static func viewController() -> PlacesViewController {
        let network = NetworkManager()
        let placesNetwork = PlacesNetworkManager(with: network)
        let databaseManager = PlacesDatabaseManager(with: CoreDataManager.shared)
        let model = PlacesModel(with: placesNetwork, databaseManager: databaseManager)
        let viewModel = PlacesViewModel(with: model)
        let controller = PlacesViewController(with: viewModel)
        return controller
    }
}
