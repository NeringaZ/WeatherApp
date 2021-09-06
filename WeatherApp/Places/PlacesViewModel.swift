//
//  PlacesViewModel.swift
//  WeatherApp
//
//  Created by Neringa on 01.03.21.
//

import UIKit

protocol PlacesViewModelDelegate: class {
    func reloadData()
}

//kur GasStationVIewModel - FuelApp?, ar tai yra GasStationAnnotation?
class PlacesViewModel: NSObject {
    
//    si klase bus table view datasource ir delegate
    private let model: PlacesModel
    private var places: [PlaceViewModelItem] = []
    private var filteredPlaces: [PlaceViewModelItem] = []
    weak var delegate: PlacesViewModelDelegate?
    
    init(with model: PlacesModel) {
        self.model = model
    }
    
    func getPlaces(with  success: @escaping () -> Void, failure: @escaping () -> Void) {
        model.getPlaces { (places: [PlaceViewModelItem]) in
            self.places = places
            self.filteredPlaces = places
            self.delegate?.reloadData()
            success()
            
        } failure: {
            failure()
        }
    }
    
    private func filterPlaces(with searchText: String) {
        
        if searchText.isEmpty {
            filteredPlaces = places
            delegate?.reloadData()
            return
        }
        
        filteredPlaces = places.filter { (place: PlaceViewModelItem) -> Bool in
            let nameContainsSearchText = place.name.lowercased().contains(searchText.lowercased())
            let shouldIncludePlaceInNewArray = nameContainsSearchText
            return shouldIncludePlaceInNewArray
        }
        
        delegate?.reloadData()
    }
}

struct PlaceViewModelItem {
    let code: String
    let name: String
    let administrativeDivision: String?
    let countryCode: String?
    
    init?(with place: PlaceModelItem) {
        guard let codeString = place.code,
              let nameString = place.name else { return nil }
        
        code = codeString
        name = nameString
        self.administrativeDivision = place.administrativeDivision
        self.countryCode = place.countryCode
    }
}

extension PlacesViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place = filteredPlaces[indexPath.row]
        let cell = PlacesTableViewCell.cell(from: tableView, with: indexPath)
        cell.set(place: place.name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPlaces.count
    }
}

extension PlacesViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension PlacesViewModel: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let utext = searchBar.text else { return }
        filterPlaces(with: utext)
        print("The printed letters are: \(utext). Total places in the list: \(places.count)")
    }
}

