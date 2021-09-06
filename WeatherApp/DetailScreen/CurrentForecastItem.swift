//
//  CurrentForecastItem.swift
//  WeatherApp
//
//  Created by Neringa on 19.04.21.
//

import Foundation

class CurrentForecastItem: Hashable {
//  let albumURL: URL
//  let albumTitle: String
//  let imageItems: [AlbumDetailItem]

//  init(albumURL: URL, imageItems: [AlbumDetailItem] = []) {
//    self.albumURL = albumURL
//    self.albumTitle = albumURL.lastPathComponent.displayNicely
//    self.imageItems = imageItems
//  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(identifier)
  }

  static func == (lhs: CurrentForecastItem, rhs: CurrentForecastItem) -> Bool {
    return lhs.identifier == rhs.identifier
  }

  private let identifier = UUID()
}
