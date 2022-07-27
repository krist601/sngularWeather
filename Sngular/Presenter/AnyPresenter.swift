//
//  AnyPresenter.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    
    func fetchData(latitude: Double, longitude: Double)
}
protocol AnyLocationsWeatherPresenter: AnyPresenter {
    func interactorDidFetchLocationsWeather(with result: Result<LocationsWeatherResponse, Error>)
    var interactor: AnyLocationsWeatherInteractor? { get set }
    var view: AnyLocationsWeatherView? { get set }
}
protocol AnyLocationsWeatherListPresenter: AnyPresenter {
    var lalitude: Double? { get set }
    var longitude: Double? { get set }
    func interactorDidFetchLocationsWeatherList(with result: Result<LocationsWeatherListResponse, Error>)
    var interactor: AnyLocationsWeatherListInteractor? { get set }
    var view: AnyLocationsWeatherListView? { get set }
}
