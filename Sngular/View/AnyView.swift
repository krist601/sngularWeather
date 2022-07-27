//
//  AnyView.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
}
protocol AnyLocationsWeatherView: AnyView {
    func update(with locationsWeather: LocationsWeatherResponse)
    func update(with error: String)
}
protocol AnyLocationsWeatherListView: AnyView {
    func update(with locationsWeatherList: LocationsWeatherListResponse)
    func update(with error: String)
}
