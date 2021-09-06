//
//  UserPlacesViewModel.swift
//  WeatherApp
//
//  Created by Neringa on 24.05.21.
//

import UIKit

protocol UserPlacesViewModelDelegate: AnyObject {
    func reloadData()
}

class  UserPlacesViewModel: NSObject {
    
    var userPlacesItems = [
        UserPlacesItem(code: "abromiskes", name: "Abromiškės", administrativeDivision: "Elektrėnų savivaldybė", countryCode: "LT"),
        UserPlacesItem(code: "acokavai", name: "Acokavai", administrativeDivision: "Radviliškio rajono savivaldybė", countryCode: "LT"),
        UserPlacesItem(code: "adakavas", name: "Adakavas", administrativeDivision: "Tauragės rajono savivaldybė", countryCode: "LT"),
        UserPlacesItem(code: "adakavas2", name: "Adakavas 2", administrativeDivision: "Tauragės rajono savivaldybė", countryCode: "LT"),
        UserPlacesItem(code: "adakavas3", name: "Adakavas 3", administrativeDivision: "Tauragės rajono savivaldybė", countryCode: "LT"),
        UserPlacesItem(code: "adakavas4", name: "Adakavas 4", administrativeDivision: "Tauragės rajono savivaldybė", countryCode: "LT")
    ]
}
