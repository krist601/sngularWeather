//
//  LocationWeather.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherPresenter: AnyLocationsWeatherPresenter {
    
    var router: AnyRouter?
    var interactor: AnyLocationsWeatherInteractor? {
        didSet {
            interactor?.getLocationsWeather()
        }
    }
    var view: AnyLocationsWeatherView?
    
    init(){
        interactor?.getLocationsWeather()
    }

    func interactorDidFetchLocationsWeather(with result: Result<LocationsWeatherResponse, Error>) {
        switch result {
        case .success(let locationsWeatherResponse):
            view?.update(with: locationsWeatherResponse)
        case .failure:
            view?.update(with: "something went wrong :(")
        }
    }
}
