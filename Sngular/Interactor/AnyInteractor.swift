//
//  AnyInteractor.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

protocol AnyLocationsWeatherInteractor {
    var presenter: AnyLocationsWeatherPresenter? { get set }
    func getLocationsWeather()
}
protocol AnyLocationsWeatherListInteractor {
    var presenter: AnyLocationsWeatherListPresenter? { get set }
    func getLocationsWeatherList()
}


