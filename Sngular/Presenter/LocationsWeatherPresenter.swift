//
//  LocationWeather.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherPresenter: AnyLocationsWeatherPresenter {
    var router: AnyRouter?
    var interactor: AnyLocationsWeatherInteractor? 
    var view: AnyLocationsWeatherView?
    
    var hasError: Error?
    var isSuccess = false
    
    func fetchData(latitude: Double, longitude: Double){
        interactor?.getLocationsWeather(latitude: latitude, longitude: longitude)
    }

    func interactorDidFetchLocationsWeather(with result: Result<LocationsWeatherResponse?, Error>) {
        switch result {
        case .success(let locationsWeatherResponse):
            isSuccess = true
            view?.update(with: locationsWeatherResponse)
        case .failure(let error):
            hasError = error
            view?.update(with: "something went wrong :(")
        }
    }
}
