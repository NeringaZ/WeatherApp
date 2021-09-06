//
//  DetailFactory.swift
//  WeatherApp
//
//  Created by Neringa on 30.03.21.
//

import Foundation

struct DetailFactory {
    static func viewController() -> DetailViewController {
        let network = NetworkManager()
        let detailNetwork = DetailNetworkManager(with: network)
        let model = DetailModel(with: detailNetwork)
        let detailModel = DetailViewModel(with: model)
        let controller = DetailViewController(with: detailModel)
        return controller
    }
}

